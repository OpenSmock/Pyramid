Class {
	#name : #PyPropertyAbstract,
	#superclass : #SpPresenter,
	#instVars : [
		'elements',
		'presenter',
		'button',
		'popover',
		'property',
		'preview'
	],
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #testing }
PyPropertyAbstract class >> isAbstract [

	^ self == PyPropertyAbstract
]

{ #category : #'as yet unclassified' }
PyPropertyAbstract class >> propertiesFromCollection: aCollection [

	| properties newCollection |
	properties := Dictionary new.
	aCollection do: [ :each | 
		| property |
		property := self propertyFromElement: each.
		properties
			at: property
			ifPresent: [ :v | v add: each ]
			ifAbsentPut: [ OrderedCollection with: each ] ].
		
	newCollection := OrderedCollection new.

	properties associationsDo: [ :each | newCollection add: (self new elements: each value) ].

	^ newCollection
]

{ #category : #'as yet unclassified' }
PyPropertyAbstract class >> property: aProperty toElement: aBlElement [

	self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
PyPropertyAbstract class >> propertyFromCollection: aCollection [

	aCollection ifEmpty: [ ^ nil ].
	^ self propertyFromElement: (aCollection at: 1)
]

{ #category : #'as yet unclassified' }
PyPropertyAbstract class >> propertyFromElement: aBlElement [

	^ self shouldBeImplemented
]

{ #category : #comparing }
PyPropertyAbstract >> = anObject [

	anObject ifNil: [ ^ false ].
	anObject class = self class ifFalse: [ ^ false ].
	^ self property = anObject property
]

{ #category : #adding }
PyPropertyAbstract >> addOn: aLayout [

	aLayout add: self expand: false
]

{ #category : #private }
PyPropertyAbstract >> apply [

self updateElements.
	self updatePreview.
	
]

{ #category : #layout }
PyPropertyAbstract >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		  spacing: 5;
		  add: button expand: false;
		  add:  preview;
		  yourself
]

{ #category : #accessing }
PyPropertyAbstract >> elements [

	^ elements
]

{ #category : #accessing }
PyPropertyAbstract >> elements: aCollection [

	elements := aCollection.
	self presenterForm activate.
	self updateProperty.
	self updatePreview.
	self updateForm
]

{ #category : #initialization }
PyPropertyAbstract >> initializeButton [

	button := SpButtonPresenter new
		          icon: (self iconNamed: #edit);
		          action: [ self presenterPopoverMenu popup ];
		          yourself
]

{ #category : #initialization }
PyPropertyAbstract >> initializeForm [

	self shouldBeImplemented
]

{ #category : #initialization }
PyPropertyAbstract >> initializePopover [

	popover := SpPopoverPresenter new
		           borderColor: Color black;
		           relativeTo: button;
		           position: SpPopoverPosition left;
		           presenter: (SpPresenter new
				            layout: (SpBoxLayout newTopToBottom
						             borderWidth: 3;
						             spacing: 5;
						             add: self presenterForm;
						             add: (SpButtonPresenter new
								              label: 'Close';
								              action: [ popover dismiss ];
								              yourself);
						             yourself);
				            yourself);
		           yourself
]

{ #category : #initialization }
PyPropertyAbstract >> initializePresenters [

	self initializeButton.
	self initializePreview.
	self initializeForm.
	self initializePopover
]

{ #category : #initialization }
PyPropertyAbstract >> initializePreview [

	preview := SpToggleButtonPresenter new
		           label: (self name);
		           whenActivatedDo: [ 
			           UIManager default defer: [ self inform: 'Activated' ] ];
		           whenDeactivatedDo:
			           [ 
			           UIManager default defer: [ self inform: 'Deactivated' ] ]
				           yourself
]

{ #category : #accessing }
PyPropertyAbstract >> name [

	^ self shouldBeImplemented 
]

{ #category : #accessing }
PyPropertyAbstract >> presenterButton [

	^ button
]

{ #category : #accessing }
PyPropertyAbstract >> presenterForm [

	^ presenter
]

{ #category : #initialization }
PyPropertyAbstract >> presenterPopoverMenu [

	^ popover
]

{ #category : #initialization }
PyPropertyAbstract >> presenterPreview [

	^ preview
]

{ #category : #accessing }
PyPropertyAbstract >> property [

	^ property
	
]

{ #category : #accessing }
PyPropertyAbstract >> property: anObject [

	property := anObject
]

{ #category : #initialization }
PyPropertyAbstract >> updateElements [

	self elements do: [ :each | self class property: self property toElement: each ]
]

{ #category : #initialization }
PyPropertyAbstract >> updateForm [

	"Change this method to change the value of the form"
	
	self presenterForm value: self property

	
]

{ #category : #'as yet unclassified' }
PyPropertyAbstract >> updatePreview [

	self presenterPreview label: self property asString.

	
]

{ #category : #'as yet unclassified' }
PyPropertyAbstract >> updateProperty [

	"Change this method to change the value of the property"

	self property: (self class propertyFromCollection: self elements)
]
