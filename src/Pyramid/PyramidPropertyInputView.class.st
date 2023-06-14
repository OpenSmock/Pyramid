Class {
	#name : #PyramidPropertyInputView,
	#superclass : #SpPresenter,
	#traits : 'TPyramidPropertyObserver',
	#classTraits : 'TPyramidPropertyObserver classTrait',
	#instVars : [
		'popoverButton',
		'popover',
		'model',
		'property',
		'propertiesView',
		'currentApplyToAllInput',
		'inputLayout',
		'popoverPresenter'
	],
	#category : #'Pyramid-properties'
}

{ #category : #accessing }
PyramidPropertyInputView >> currentApplyToAllInput [
^ currentApplyToAllInput
]

{ #category : #accessing }
PyramidPropertyInputView >> currentApplyToAllInput: anObject [

	currentApplyToAllInput := anObject
]

{ #category : #layout }
PyramidPropertyInputView >> defaultLayout [

	| label |
	label := SpLabelPresenter new
		         displayBold: [ true ];
		         label: self property inputsModel sectionName;
		         yourself.
	inputLayout := (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: self popoverButton withConstraints: [ :c |
					   c
						   width: 24;
						   height: 24 ];
				   add: self currentApplyToAllInput expand: true;
				   yourself).
	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: label;
		  add: inputLayout;
		  add: SpNullPresenter new height: 8;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputView >> hidePopover [

	self popover ifNotNil: [
		self popover dismiss. ]
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputView >> initializePresenters [

	popoverButton := SpButtonPresenter new
		                 icon: (self iconNamed: #edit);
		                 action: [ self popover popup ];
		                 enabled: false;
		                 yourself.
	popoverPresenter := PyramidPropertyPopoverView new
		                    property: self property;
		                    yourself.
	popover := PyramidPopoverFactory makeWithPresenter: popoverPresenter relativeTo: popoverButton position: SpPopoverPosition left
]

{ #category : #accessing }
PyramidPropertyInputView >> inputLayout [
	^ inputLayout
]

{ #category : #accessing }
PyramidPropertyInputView >> popover [

	^ popover
]

{ #category : #accessing }
PyramidPropertyInputView >> popoverButton [

	^ popoverButton
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputView >> popoverPresenter [

	^ popoverPresenter
]

{ #category : #accessing }
PyramidPropertyInputView >> propertiesView [

	^ propertiesView
]

{ #category : #accessing }
PyramidPropertyInputView >> propertiesView: anObject [

	propertiesView := anObject
]

{ #category : #accessing }
PyramidPropertyInputView >> property [

	^ property
]

{ #category : #accessing }
PyramidPropertyInputView >> property: anObject [

	property := anObject.
	self popoverPresenter property: anObject
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputView >> pyramidInputsUpdated [

	(self inputLayout isNotNil and: [
		 self currentApplyToAllInput isNotNil ]) ifTrue: [
		self inputLayout
			replace: self currentApplyToAllInput
			with: self property inputsModel applyToAllInput ].
	self currentApplyToAllInput:
		self property inputsModel applyToAllInput.


	self property inputsModel shouldDisplay
		ifFalse: [ self propertiesView hide: self ]
		ifTrue: [ self propertiesView show: self ].

	self property inputsModel elementInputsSize < 2
		ifTrue: [ self popoverButton enabled: false ]
		ifFalse: [ self popoverButton enabled: true ].

	popover := PyramidPopoverFactory makeWithPresenter: popoverPresenter relativeTo: popoverButton position: SpPopoverPosition left.

	self popoverPresenter updateLayout
]
