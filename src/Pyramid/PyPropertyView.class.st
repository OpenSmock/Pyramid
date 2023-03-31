Class {
	#name : #PyPropertyView,
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
PyPropertyView >> controller [

	controller ifNil: [
		PyMissingControllerError signal: 'a PyControllerProperty is needed.' ].
	^ controller
]

{ #category : #accessing }
PyPropertyView >> controller: aPyControllerProperty [

	controller := aPyControllerProperty
]

{ #category : #'as yet unclassified' }
PyPropertyView >> createEditButton [

	^ SpButtonPresenter new
		  icon: (self iconNamed: #edit);
		  extent: 10 asPoint;
		  action: [ self popoverShow ];
		enabled: false;
		  yourself
]

{ #category : #'as yet unclassified' }
PyPropertyView >> createMultiForm [

	| globalLayout scroll |
	globalLayout := SpBoxLayout newVertical spacing: 4.

	self selection ifEmpty: [ ^ globalLayout ].

	self selection elements do: [ :each |
		self createMultiFormEntryFor: each on: globalLayout ].

	self multiFormClass numberOfEntriesBeforeScrolling
	< self selection size
		ifTrue: [
			scroll := SpScrollableLayout new.
			scroll child: globalLayout.
			^ SpBoxLayout newVertical
				  add: scroll withConstraints: [ :c |
					  c width: 300.
					  c height: 300 ];
				  yourself ]
		ifFalse: [ ^ globalLayout ]
]

{ #category : #'as yet unclassified' }
PyPropertyView >> createMultiFormEntryFor: each on: globalLayout [

	| identityLabel elementPresenter applyToAllButton |
	identityLabel := self newLabel
		                 label: each identityHash printString;
		                 yourself.
	elementPresenter := self multiFormClass new
		                    currentValue:
			                    (self controller valueFromElement: each);
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
				 vAlignCenter;
				 spacing: 4;
				 add: identityLabel width: 70;
				 add: elementPresenter;
				 add: applyToAllButton withConstraints: [ :c |
					 c
						 width: 24;
						 height: 24 ];
				 yourself)
		withConstraints: [ :c | c width: 300 ]
]

{ #category : #'as yet unclassified' }
PyPropertyView >> createPopover [

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
PyPropertyView >> createSectionLabel [

	^ SpLabelPresenter new
		  label: self sectionNameFull;
		  yourself
]

{ #category : #'as yet unclassified' }
PyPropertyView >> createSingleForm [

	^ PyFormVoid new
]

{ #category : #'as yet unclassified' }
PyPropertyView >> defaultLayout [

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
PyPropertyView >> editButton [

	^ editButton
]

{ #category : #accessing }
PyPropertyView >> initializePresenters [

	editButton := self createEditButton.
	singleForm := self createSingleForm.
	popover := self createPopover.
	sectionLabel := self createSectionLabel
]

{ #category : #'as yet unclassified' }
PyPropertyView >> multiFormClass [ 

	^ mutliFormClass
]

{ #category : #'as yet unclassified' }
PyPropertyView >> mutliFormClass: aClass [

	mutliFormClass := aClass
]

{ #category : #initialization }
PyPropertyView >> popover [

	^ popover
]

{ #category : #'as yet unclassified' }
PyPropertyView >> popoverHide [
	self popover dismiss.
]

{ #category : #'as yet unclassified' }
PyPropertyView >> popoverShow [

	self popover popup
]

{ #category : #'as yet unclassified' }
PyPropertyView >> pySelectionChanged [

	self updateSectionComplement 
]

{ #category : #'as yet unclassified' }
PyPropertyView >> sectionComplement [
	
	sectionComplement ifNil: [ sectionComplement := 'sectionComplement' ].
	^ sectionComplement
]

{ #category : #accessing }
PyPropertyView >> sectionComplement: aString [

	sectionComplement := aString.
	self updateSectionLabel
]

{ #category : #'as yet unclassified' }
PyPropertyView >> sectionLabel [

	^ sectionLabel
]

{ #category : #'as yet unclassified' }
PyPropertyView >> sectionName [

	sectionName ifNil: [ sectionName := self class name ].
	^ sectionName
]

{ #category : #accessing }
PyPropertyView >> sectionName: aString [

	sectionName := aString.
	self updateSectionLabel
]

{ #category : #'as yet unclassified' }
PyPropertyView >> sectionNameFull [
	^ self sectionName , '-' , self sectionComplement
]

{ #category : #accessing }
PyPropertyView >> singleForm [

	^ singleForm
]

{ #category : #'as yet unclassified' }
PyPropertyView >> singleForm: aPyForm [

	singleForm := aPyForm
]

{ #category : #'as yet unclassified' }
PyPropertyView >> singleFormClass: aClass [

	self singleForm:( aClass new action: [ :value |
		self controller applyValue: value ]; yourself).
	self updateView
]

{ #category : #'as yet unclassified' }
PyPropertyView >> updatePopover [
	popover := self createPopover
]

{ #category : #'as yet unclassified' }
PyPropertyView >> updateSectionComplement [

	self selection ifEmpty: [
		self sectionComplement: '0 element'.
		^ self ].
	self selection size = 1 ifTrue: [
		self sectionComplement: '1 element (', self selection elements first identityHash printString, ')'.
		^ self ].
	self sectionComplement: self selection size printString , ' elements'
]

{ #category : #'as yet unclassified' }
PyPropertyView >> updateSectionLabel [

	self sectionLabel label: self sectionNameFull
]

{ #category : #'as yet unclassified' }
PyPropertyView >> updateView [

	self layout: self defaultLayout.
	self update
]
