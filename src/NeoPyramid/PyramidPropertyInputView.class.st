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
	^ SpBoxLayout newHorizontal spacing: 4; add: self popoverButton expand: false; add: self model globalInput expand: true; yourself.
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
						    borderWidth: 3;
						    spacing: 5;
						    add: self popoverLayout width: 300;
						    add: (SpButtonPresenter new
								     label: 'Close';
								     action: [ self hidePopover ];
								     yourself);
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
PyramidPropertyInputView >> popoverLayout [

	| popoverLayout |
	popoverLayout := SpBoxLayout newVertical
		                 spacing: 4;
		                 yourself.
	self model elementInputModel do: [ :each | popoverLayout add: (self singlePopoverElementLayout: each) ].
	^ popoverLayout
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputView >> showPopover [

	self popover popup
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputView >> singlePopoverElementLayout: aModel [

	| label |
	label := SpLabelPresenter new
		         label: aModel referenceObject hash printString;
		         yourself.
	
	aModel stateInput icon: (self iconNamed: #merge).
	aModel modelInput icon: (self iconNamed: #smallExpert).

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: label width: 70;
		  add: aModel elementInput expand: true;
		  add: aModel stateInput withConstraints: [ :c |
					 c
						 width: 24;
						 height: 24 ];
		  add: aModel modelInput withConstraints: [ :c |
					 c
						 width: 24;
						 height: 24 ];
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputView >> updatePopover [

	popover := self makePopover
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputView >> updateView [

	self model elementInputSize = 0
		ifTrue: [ self model globalInput enabled: false ]
		ifFalse: [ self model globalInput enabled: true ].

	self model elementInputSize < 2
		ifTrue: [
			self popoverButton enabled: false ]
		ifFalse: [
			self popoverButton enabled: true.
			self updatePopover ]
]
