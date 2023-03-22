Trait {
	#name : #TPyViewProperty,
	#instVars : [
		'editButton',
		'simpleForm',
		'singleLineForm',
		'selection',
		'popover',
		'nameLabel',
		'pipeline'
	],
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #comparing }
TPyViewProperty >> < aPyViewProperty [
	^ self order < aPyViewProperty order.
]

{ #category : #'as yet unclassified' }
TPyViewProperty >> applyValue: aValue to: aPySelection [

	self pipeline selection: aPySelection.
	self pipeline useCommand: (self commandWith: aValue).
	self selection notifyObservers
]

{ #category : #'as yet unclassified' }
TPyViewProperty >> createEditButton [

	^ SpButtonPresenter new
		  icon: (self iconNamed: #edit);
		  extent: 10 asPoint;
		  action: [ self showPopover ];
		enabled: false;
		  yourself
]

{ #category : #'as yet unclassified' }
TPyViewProperty >> createMultipleLineForm [

	^ self createSingleLineForm
]

{ #category : #'as yet unclassified' }
TPyViewProperty >> createMultipleSelectionPresenter [

	| globalLayout |
	globalLayout := SpBoxLayout newVertical spacing: 4.

	self selection elements do: [ :each |
		| elementPresenter applyToAllButton |
		elementPresenter := self createMultipleLineForm
			                    currentValue: (self valueFromElement: each);
			                    action: [ :value |
				                    self applyValue: value to: (PySelection new
							                     add: each;
							                     yourself). self showPopover ];
			                    yourself.

		applyToAllButton := SpButtonPresenter new
			                    icon: (self iconNamed: #smallExpert);
			                    extent: 10 asPoint;
			                    action: [
				                    self
					                    applyValue: elementPresenter currentValue
					                    to: self selection.
				                    self showPopover ];
			                    yourself.
		globalLayout
			add: (SpBoxLayout newHorizontal
					 spacing: 4;
					 add: elementPresenter;
					 add: applyToAllButton withConstraints: [ :c |
						 c
							 width: 24;
							 height: 24 ];
					 yourself)
			withConstraints: [ :c | c width: 300 ];
			yourself ].
	^ globalLayout
]

{ #category : #'as yet unclassified' }
TPyViewProperty >> createNameLabel [

	^ SpLabelPresenter new
		  label: self nameOfSection;
		  yourself
]

{ #category : #'as yet unclassified' }
TPyViewProperty >> createPopover [

	^ SpPopoverPresenter new
		  borderColor: Color black;
		  relativeTo: self editButton;
		  position: SpPopoverPosition left;
		  presenter: (SpPresenter new
				   layout: (SpBoxLayout newTopToBottom
						    borderWidth: 3;
						    spacing: 5;
						    add: self createMultipleSelectionPresenter;
						    add: (SpButtonPresenter new
								     label: 'Close';
								     action: [ popover dismiss ];
								     yourself);
						    yourself);
				   yourself);
		  yourself
]

{ #category : #'as yet unclassified' }
TPyViewProperty >> createSingleLineForm [

	^ self shouldBeImplemented 
]

{ #category : #'as yet unclassified' }
TPyViewProperty >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: self nameLabel;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: self editButton withConstraints: [ :c |
					   c
						   width: 24;
						   height: 24 ];
				   add: self singleLineForm expand: true;
				   yourself);
		  yourself
]

{ #category : #accessing }
TPyViewProperty >> editButton [

	^ editButton
]

{ #category : #accessing }
TPyViewProperty >> initializePresenters [

	editButton := self createEditButton.
	singleLineForm := self createSingleLineForm.
	popover := self createPopover.
	nameLabel := self createNameLabel.

	singleLineForm enabled: false.
	singleLineForm action: [ :value |
		self applyValue: value to: self selection ]
]

{ #category : #accessing }
TPyViewProperty >> name [

	^ 'Default property name - TPyViewProperty'
]

{ #category : #accessing }
TPyViewProperty >> nameLabel [

	^ nameLabel
]

{ #category : #'as yet unclassified' }
TPyViewProperty >> nameOfSection [

	self selection size < 2 ifTrue: [
		^ self name , ' - for ' , self selection size printString
		  , ' element' ].
	^ self name , ' - for ' , self selection size printString
	  , ' elements'
]

{ #category : #accessing }
TPyViewProperty >> order [

	^ 0
]

{ #category : #accessing }
TPyViewProperty >> pipeline [

	pipeline ifNil: [ pipeline := PyPipeline new ].
	^ pipeline
]

{ #category : #accessing }
TPyViewProperty >> pipeline: aPipeline [

	pipeline := aPipeline
]

{ #category : #initialization }
TPyViewProperty >> popover [

	^ popover
]

{ #category : #'as yet unclassified' }
TPyViewProperty >> selection [

	selection ifNil: [ selection := PySelection new ].
	^ selection
]

{ #category : #accessing }
TPyViewProperty >> selection: aSelection [

	selection := aSelection.
	self popover dismiss.
	self nameLabel label: self nameOfSection.

	aSelection ifEmpty: [
		self selectionIsEmpty.
		^ self ].
	aSelection size = 1 ifTrue: [
		self selectionIsSingle.
		^ self ].
	self selectionIsMultiple
]

{ #category : #'as yet unclassified' }
TPyViewProperty >> selectionIsEmpty [

	self editButton enabled: false.
	self singleLineForm enabled: false.
	self singleLineForm currentValue: self emptyValue
]

{ #category : #'as yet unclassified' }
TPyViewProperty >> selectionIsMultiple [

	self editButton enabled: true.
	self singleLineForm enabled: true.
	self singleLineForm currentValue:
		(self valueFromElements: self selection elements).

	popover := self createPopover
]

{ #category : #'as yet unclassified' }
TPyViewProperty >> selectionIsSingle [

	self editButton enabled: false.
	self singleLineForm enabled: true.
	self singleLineForm currentValue:
		(self valueFromElement: self selection elements first)
]

{ #category : #'as yet unclassified' }
TPyViewProperty >> showPopover [

	self popover popup
]

{ #category : #accessing }
TPyViewProperty >> singleLineForm [

	^ singleLineForm
]

{ #category : #'as yet unclassified' }
TPyViewProperty >> valueFromElement: anElement [

	^ self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
TPyViewProperty >> valueFromElements: aCollection [

	| allValues |
	allValues := (aCollection collect: [ :each |
		              self valueFromElement: each ]) asSet asArray.

	allValues size = 1
		ifTrue: [ ^ allValues first ]
		ifFalse: [ ^ self differentsValue ]
]
