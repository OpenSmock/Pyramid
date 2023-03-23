Class {
	#name : #PyViewProperty,
	#superclass : #SpPresenter,
	#traits : 'TPySelectionObserver',
	#classTraits : 'TPySelectionObserver classTrait',
	#instVars : [
		'singleForm',
		'editButton',
		'mutliFormClass',
		'controller',
		'sectionName',
		'sectionComplement',
		'popover',
		'sectionLabel'
	],
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #accessing }
PyViewProperty >> controller [

	controller ifNil: [
		Error signal: 'Do not use me without a controller' ].
	^ controller
]

{ #category : #accessing }
PyViewProperty >> controller: aPyControllerProperty [

	controller := aPyControllerProperty
]

{ #category : #'as yet unclassified' }
PyViewProperty >> createEditButton [

	^ SpButtonPresenter new
		  icon: (self iconNamed: #edit);
		  extent: 10 asPoint;
		  action: [ self popoverShow ];
		enabled: false;
		  yourself
]

{ #category : #'as yet unclassified' }
PyViewProperty >> createMultiForm [

	| globalLayout |
	globalLayout := SpBoxLayout newVertical spacing: 4.

	self selection elements do: [ :each |
		| elementPresenter applyToAllButton |
		elementPresenter := self multiFormClass new
			                    currentValue: (self controller valueFromElement: each);
			                    action: [ :value |
				                    self controller
					                    applyValue: value
					                    to: (PySelection new
							                     add: each;
							                     yourself).
				                    self popoverShow ];
			                    yourself.

		applyToAllButton := SpButtonPresenter new
			                    icon: (self iconNamed: #smallExpert);
			                    extent: 10 asPoint;
			                    action: [
				                    self controller applyValue:
						                    elementPresenter currentValue.
				                    self popoverShow ];
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
PyViewProperty >> createPopover [

	^ SpPopoverPresenter new
		  borderColor: Color black;
		  relativeTo: self editButton;
		  position: SpPopoverPosition left;
		  presenter: (SpPresenter new
				   layout: (SpBoxLayout newTopToBottom
						    borderWidth: 3;
						    spacing: 5;
						    add: self createMultiForm;
						    add: (SpButtonPresenter new
								     label: 'Close';
								     action: [ popover dismiss ];
								     yourself);
						    yourself);
				   yourself);
		  yourself
]

{ #category : #'as yet unclassified' }
PyViewProperty >> createSectionLabel [

	^ SpLabelPresenter new
		  label: self sectionNameFull;
		  yourself
]

{ #category : #'as yet unclassified' }
PyViewProperty >> createSingleForm [

	^ PyFormVoid new
]

{ #category : #'as yet unclassified' }
PyViewProperty >> defaultLayout [

	^ SpBoxLayout newVertical
		  add: self sectionLabel;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: self editButton withConstraints: [ :c |
					   c
						   width: 24;
						   height: 24 ];
				   add: self singleForm expand: true;
				   yourself);
		  yourself
]

{ #category : #accessing }
PyViewProperty >> editButton [

	^ editButton
]

{ #category : #accessing }
PyViewProperty >> initializePresenters [

	editButton := self createEditButton.
	singleForm := self createSingleForm.
	popover := self createPopover.
	sectionLabel := self createSectionLabel
]

{ #category : #'as yet unclassified' }
PyViewProperty >> multiFormClass [ 

	^ mutliFormClass
]

{ #category : #'as yet unclassified' }
PyViewProperty >> mutliFormClass: aClass [

	mutliFormClass := aClass
]

{ #category : #initialization }
PyViewProperty >> popover [

	^ popover
]

{ #category : #'as yet unclassified' }
PyViewProperty >> popoverHide [
	self popover dismiss.
]

{ #category : #'as yet unclassified' }
PyViewProperty >> popoverShow [

	self popover popup
]

{ #category : #'as yet unclassified' }
PyViewProperty >> pySelectionChanged [

	self updateSectionComplement 
]

{ #category : #'as yet unclassified' }
PyViewProperty >> sectionComplement [
	
	sectionComplement ifNil: [ sectionComplement := 'sectionComplement' ].
	^ sectionComplement
]

{ #category : #accessing }
PyViewProperty >> sectionComplement: aString [

	sectionComplement := aString.
	self updateSectionLabel
]

{ #category : #'as yet unclassified' }
PyViewProperty >> sectionLabel [

	^ sectionLabel
]

{ #category : #'as yet unclassified' }
PyViewProperty >> sectionName [

	sectionName ifNil: [ sectionName := self class name ].
	^ sectionName
]

{ #category : #accessing }
PyViewProperty >> sectionName: aString [

	sectionName := aString.
	self updateSectionLabel
]

{ #category : #'as yet unclassified' }
PyViewProperty >> sectionNameFull [
	^ self sectionName , '-' , self sectionComplement
]

{ #category : #accessing }
PyViewProperty >> singleForm [

	^ singleForm
]

{ #category : #'as yet unclassified' }
PyViewProperty >> singleForm: aPyForm [

	singleForm := aPyForm
]

{ #category : #'as yet unclassified' }
PyViewProperty >> singleFormClass: aClass [

	self singleForm:( aClass new action: [ :value |
		self controller applyValue: value ]; yourself).
	self updateView
]

{ #category : #'as yet unclassified' }
PyViewProperty >> updatePopover [
	popover := self createPopover
]

{ #category : #'as yet unclassified' }
PyViewProperty >> updateSectionComplement [
	self selection ifEmpty: [ self sectionComplement: '0 element'. ^ self ].
	self selection size = 1 ifTrue: [ self sectionComplement: '1 element'. ^ self ].
	self sectionComplement: self selection size printString , ' elements'
]

{ #category : #'as yet unclassified' }
PyViewProperty >> updateSectionLabel [

	self sectionLabel label: self sectionNameFull
]

{ #category : #'as yet unclassified' }
PyViewProperty >> updateView [

	self layout: self defaultLayout.
	self update
]
