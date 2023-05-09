Class {
	#name : #PyramidPropertyViewBuilder,
	#superclass : #Object,
	#instVars : [
		'popoverButton',
		'popover',
		'model'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #'as yet unclassified' }
PyramidPropertyViewBuilder >> buildPopoverLayout [

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
	self model elementInputsModel do: [ :each |
		inputsLayout add: (self singleInputOnPopoverLayout: each) ].

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

{ #category : #accessing }
PyramidPropertyViewBuilder >> model [
^ model
]

{ #category : #accessing }
PyramidPropertyViewBuilder >> model: aModel [

	model := aModel
]

{ #category : #'as yet unclassified' }
PyramidPropertyViewBuilder >> popoverMaxHeight [
^ 300
]

{ #category : #'as yet unclassified' }
PyramidPropertyViewBuilder >> popoverMaxWidth [

	^ 300
]

{ #category : #'as yet unclassified' }
PyramidPropertyViewBuilder >> singleInputOnPopoverLayout: aModel [

	| label |
	label := SpLabelPresenter new
		         label: aModel referenceObject hash printString;
		         yourself.

	aModel applyToAllButton icon: (self iconNamed: #smallExpert).

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: label width: 70;
		  add: aModel input expand: true;
		  add: aModel applyToAllButton withConstraints: [ :c |
			  c
				  width: 24;
				  height: 24 ];
		  yourself
]
