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
				   add: self model globalInput expand: true;
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
						    add: self popoverLayout;
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
PyramidPropertyInputView >> popoverLayout [

	| popoverLayout inputsLayout label |
	label := SpLabelPresenter new
		         displayBold: [ true ];
		         label: self model sectionName;
		         yourself.
	popoverLayout := SpBoxLayout newVertical
		                 spacing: 4;
		                 add: label height: 24;
		                 yourself.

	inputsLayout := SpBoxLayout new
		                spacing: 4;
		                yourself.
	self model elementInputModel do: [ :each |
		inputsLayout add: (self singlePopoverElementLayout: each) ].

	self model elementInputSize * 25 > (self popoverMaxHeight - 80)
		ifTrue: [
			popoverLayout
				add: (SpScrollableLayout new
						 child: inputsLayout;
						 yourself)
				withConstraints: [ :c |
					c width: self popoverMaxWidth.
					c height: self popoverMaxHeight ] ]
		ifFalse: [
			self flag: #BUG. "The SpTextFieldPresenter seem to not be displayed of the
			correct size. I added a null presenter to make sure every inputs are visible."
			inputsLayout add: SpNullPresenter new height: 24.
			popoverLayout add: inputsLayout width: self popoverMaxWidth ].
	^ popoverLayout
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputView >> popoverMaxHeight [
^ 300
]

{ #category : #'as yet unclassified' }
PyramidPropertyInputView >> popoverMaxWidth [

	^ 300
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
