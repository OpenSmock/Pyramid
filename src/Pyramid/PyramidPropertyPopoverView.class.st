Class {
	#name : #PyramidPropertyPopoverView,
	#superclass : #SpPresenter,
	#instVars : [
		'property',
		'groupButton',
		'soloButton'
	],
	#category : #'Pyramid-properties'
}

{ #category : #'as yet unclassified' }
PyramidPropertyPopoverView >> defaultLayout [

	^ self defaultLayoutFor: self soloLayout withSize: 0
]

{ #category : #'as yet unclassified' }
PyramidPropertyPopoverView >> defaultLayoutFor: aPresenter withSize: numberOfInputs [

	| popoverLayout |
	popoverLayout := SpBoxLayout newVertical
		                 spacing: 4;
		                 add: self topbarLayout height: 24;
		                 yourself.

	numberOfInputs * 25
	> (self popoverMaxHeight - 80)
		ifTrue: [
			popoverLayout
				add: (SpScrollableLayout new
						 child: aPresenter;
						 yourself)
				withConstraints: [ :c |
					c width: self popoverMaxWidth.
					c height: self popoverMaxHeight ] ]
		ifFalse: [
			self flag: #BUG. "The SpTextFieldPresenter seem to not be displayed of the
			correct size. I added a null presenter to make sure every inputs are visible."
			aPresenter add: SpNullPresenter new height: 24.
			popoverLayout add: aPresenter width: self popoverMaxWidth ].
	^ popoverLayout
]

{ #category : #accessing }
PyramidPropertyPopoverView >> groupButton [

	^ groupButton
]

{ #category : #'as yet unclassified' }
PyramidPropertyPopoverView >> groupInputOnPopoverLayout: aModel [

	| collectionSize string label |
	collectionSize := aModel reference size.
	string := collectionSize printString , ' element'.
	collectionSize > 1 ifTrue: [ string := string , 's' ].

	label := SpLabelPresenter new
		         label: string;
		         yourself.
	^ self inputOnPopoverLayout: aModel withLabel: label
]

{ #category : #'as yet unclassified' }
PyramidPropertyPopoverView >> groupLayout [

	| inputsLayout |
	inputsLayout := SpBoxLayout new
		                spacing: 4;
		                yourself.
	self property inputsModel stateInputsModel do: [ :each |
		inputsLayout add: (self groupInputOnPopoverLayout: each) ].
	^ inputsLayout
]

{ #category : #initialization }
PyramidPropertyPopoverView >> initializePresenters [

	soloButton := SpRadioButtonPresenter new
		              label: 'Unique';
		              yourself.
	groupButton := SpRadioButtonPresenter new
		               label: 'Grouped';
		               yourself.
	soloButton associatedRadioButtons: { groupButton }.
	soloButton whenActivatedDo: [ self updateLayout ].
	soloButton whenDeactivatedDo: [ self updateLayout ]
]

{ #category : #'as yet unclassified' }
PyramidPropertyPopoverView >> inputOnPopoverLayout: aModel withLabel: aLabel [

	aModel applyToAllButton icon: (self iconNamed: #smallExpert).

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  add: aLabel width: 70;
		  add: aModel input expand: true;
		  add: aModel applyToAllButton withConstraints: [ :c |
			  c
				  width: 24;
				  height: 24 ];
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidPropertyPopoverView >> popoverMaxHeight [
^ 300
]

{ #category : #'as yet unclassified' }
PyramidPropertyPopoverView >> popoverMaxWidth [

	^ 300
]

{ #category : #accessing }
PyramidPropertyPopoverView >> property [

	^ property
]

{ #category : #accessing }
PyramidPropertyPopoverView >> property: aProperty [

	property := aProperty
]

{ #category : #accessing }
PyramidPropertyPopoverView >> soloButton [
^ soloButton
]

{ #category : #'as yet unclassified' }
PyramidPropertyPopoverView >> soloInputOnPopoverLayout: aModel [

	| label |
	label := SpLabelPresenter new
		         label: aModel reference hash printString;
		         yourself.
	^ self inputOnPopoverLayout: aModel withLabel: label
]

{ #category : #'as yet unclassified' }
PyramidPropertyPopoverView >> soloLayout [

	| inputsLayout |
	inputsLayout := SpBoxLayout new
		                spacing: 4;
		                yourself.
	self property inputsModel elementInputsModel do: [ :each |
		inputsLayout add: (self soloInputOnPopoverLayout: each) ].
	^ inputsLayout
]

{ #category : #'as yet unclassified' }
PyramidPropertyPopoverView >> topbarLayout [

	| label |
	label := SpLabelPresenter new
		         displayBold: [ true ];
		         label: self property inputsModel sectionName;
		         yourself.

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: label expand: true;
				   add: (SpBoxLayout newHorizontal
						    spacing: 4;
						    add: self soloButton width: 75;
						    add: self groupButton width: 75;
						    yourself)
				   expand: false;
				   yourself)
		  height: 24;
		  yourself
]

{ #category : #private }
PyramidPropertyPopoverView >> updateLayout [

	| layoutToShow numberOfInputs |
	self soloButton state
		ifTrue: [
			layoutToShow := self soloLayout.
			numberOfInputs := self property inputsModel elementInputsModel size ]
		ifFalse: [
			layoutToShow := self groupLayout.
			numberOfInputs := self property inputsModel stateInputsModel size ].
	self layout: (self defaultLayoutFor: layoutToShow withSize: numberOfInputs)
]
