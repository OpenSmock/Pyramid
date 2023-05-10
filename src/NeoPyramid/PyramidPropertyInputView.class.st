Class {
	#name : #PyramidPropertyInputView,
	#superclass : #SpPresenter,
	#instVars : [
		'popoverButton',
		'popover',
		'model'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #layout }
PyramidPropertyInputView >> defaultLayout [

	| label |
	label := SpLabelPresenter new
		         displayBold: [ true ];
		         label: self model sectionName;
		         yourself.

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: label;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: self popoverButton withConstraints: [ :c |
					   c
						   width: 24;
						   height: 24 ];
				   add: self model applyToAllInput expand: true;
				   yourself);
		 add: SpNullPresenter new height: 8;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputView >> hidePopover [

	self popover ifNotNil: [ self popover dismiss ]
	
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputView >> initializePresenters [

	popoverButton := self makePopoverButton.

]

{ #category : #'as yet unclassified' }
PyramidPropertyInputView >> makePopover [

	^ SpPopoverPresenter new
		  borderColor: Color black;
		  relativeTo: self popoverButton;
		  position: SpPopoverPosition left;
		  presenter: (SpPresenter new
				   layout: (SpBoxLayout newTopToBottom
						    spacing: 4;
						    add: self popoverPresenter;
						    add: (SpButtonPresenter new
								     label: 'Close';
								     action: [ self hidePopover ];
								     yourself)
						    height: 24;
						    yourself);
				   yourself);
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputView >> makePopoverButton [

	^ SpButtonPresenter new
		                 icon: (self iconNamed: #edit);
		                 action: [ self showPopover ];
		                 enabled: false;
		                 yourself
]

{ #category : #accessing }
PyramidPropertyInputView >> model [

	model ifNil: [ model := PyramidPropertyInputModel new ].
	^ model
]

{ #category : #accessing }
PyramidPropertyInputView >> model: anObject [

	model := anObject
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

	^ PyramidPropertyPopoverView new
		  model: self model;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputView >> showPopover [

	self popover popup
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputView >> updatePopover [

	popover := self makePopover
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputView >> updateView [

	self model elementInputSize = 0
		ifTrue: [ self model applyToAllInput enabled: false ]
		ifFalse: [ self model applyToAllInput enabled: true ].

	self model elementInputSize < 2
		ifTrue: [
			self popoverButton enabled: false ]
		ifFalse: [
			self popoverButton enabled: true.
			self updatePopover ]
]
