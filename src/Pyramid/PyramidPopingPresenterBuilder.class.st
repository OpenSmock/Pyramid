"
I transform a `PyramidCluster` and a `NeoPyramidProperty` into a `SpPresenter`.

I create a presenter with a main input to change property of all element at once and a button to show a popup with properties in group and in individual.

"
Class {
	#name : #PyramidPopingPresenterBuilder,
	#superclass : #PyramidPropertyPresenterBuilder,
	#category : 'Pyramid-property'
}

{ #category : #'as yet unclassified' }
PyramidPopingPresenterBuilder >> build [

	| presenterAll presentersGrouped presentersIndividual layout |
	presenterAll := self buildPresenterAll.

	self cluster size > 1
		ifTrue: [
			presentersGrouped := self buildPresentersGrouped.
			presentersIndividual := self buildPresentersIndividual.
			layout := self
				          buildLayoutAll: presenterAll
				          grouped: presentersGrouped
				          individual: presentersIndividual ]
		ifFalse: [ layout := self buildLayoutOnlyForAll: presenterAll ].

	^ SpPresenter new
		  layout: layout;
		  yourself.
]

{ #category : #'as yet unclassified' }
PyramidPopingPresenterBuilder >> buildLayoutAll: presenterAll grouped: presentersGrouped individual: presentersIndividual [

	| presenterPopup buttonPopup |
	presenterPopup := PyramidPropertyPopupPresenter new
		                  name: self property name
		                  grouped: presentersGrouped
		                  individual: presentersIndividual;
		                  yourself.

	buttonPopup := SpButtonPresenter new
		               icon: (Smalltalk ui icons iconNamed: #edit);
		help: 'Show groups and individuals values';
		               yourself.

	buttonPopup action: [
		(PyramidPopoverFactory
			 makeWithPresenter: presenterPopup
			 relativeTo: buttonPopup
			 position: SpPopoverPosition left) popup ].
	^ self layoutForAll: presenterAll buttonPopup: buttonPopup
]

{ #category : #'as yet unclassified' }
PyramidPopingPresenterBuilder >> buildLayoutOnlyForAll: presenterAll [

	| buttonPopup |
	buttonPopup := SpButtonPresenter new
		               icon: (Smalltalk ui icons iconNamed: #edit);
		               enabled: false;
		               yourself.

	^ self layoutForAll: presenterAll buttonPopup: buttonPopup
]

{ #category : #'as yet unclassified' }
PyramidPopingPresenterBuilder >> buildPresenterAll [

	| input |
	input := self makeNewInput.

	self cluster isEmpty ifTrue: [
		input emptyValue.
		^ input ].

	self cluster isTargetsSameArguments
		ifTrue: [ input value: self cluster groups first ]
		ifFalse: [ input mixedValues ].

	input whenValueChangedDo: [ :value |
		self property commandExecutor
			use: self property command
			on: self cluster allTargets
			with: value ].
	^ input
]

{ #category : #'as yet unclassified' }
PyramidPopingPresenterBuilder >> buildPresenterWithButtonsFor: anAssociation withLabel: aString [

	| input buttonApplyToAll layout |
	input := self makeNewInput.
	input value: anAssociation key.
	input whenValueChangedDo: [ :value |
		self property commandExecutor
			use: self property command
			on: anAssociation value
			with: value ].

	buttonApplyToAll := SpButtonPresenter new
		                    icon: (Smalltalk ui icons iconNamed: #smallExpert);
		help: 'Apply this value to all selected elements.';
		                    action: [
			                    self property commandExecutor
				                    use: self property command
				                    on: self cluster allTargets
				                    with: input value ].
	layout := self
		          layoutForLabel: aString
		          input: input
		          button: buttonApplyToAll.
	^ SpPresenter new
		  layout: layout;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidPopingPresenterBuilder >> buildPresentersGrouped [

	| size label |
	self cluster isEmpty ifTrue: [ ^ {  } ].
	^ self cluster groupedAssociations associations collect: [ :each |
		  size := each value size.
		  label := size = 1
			           ifTrue: [ '1 element' ]
			           ifFalse: [ size printString , ' elements' ].
		  self buildPresenterWithButtonsFor: each withLabel: label ]
]

{ #category : #'as yet unclassified' }
PyramidPopingPresenterBuilder >> buildPresentersIndividual [

	| label |
	self cluster isEmpty ifTrue: [ ^ {  } ].
	^ self cluster individualAssociations collect: [ :each |
		  label := each value first hash printString.
		  self buildPresenterWithButtonsFor: each withLabel: label ]
]

{ #category : #'as yet unclassified' }
PyramidPopingPresenterBuilder >> layoutForAll: presenterAll buttonPopup: buttonPopup [

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   vAlignCenter;
				   add: buttonPopup width: 24;
				   add: (SpLabelPresenter new
						    label: self property name;
						    displayBold: [ :t | true ];
						    yourself);
				   yourself)
		  height: 24;
		  add: presenterAll expand: false;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidPopingPresenterBuilder >> layoutForLabel: aString input: anInput button: aButton [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		vAlignCenter;
		  add: aString width: 80;
		  add: anInput;
		  add: aButton width: 24;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidPopingPresenterBuilder >> makeNewInput [

	^ self property pyramidInputPresenterClass new
		  strings: self property pyramidInputPresenterStrings;
		  yourself
]
