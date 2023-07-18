"
I transform a `PyramidCluster` and a `NeoPyramidProperty` into a `SpPresenter`.

I create a presenter with a main input to change property of all element at once and a button to show a popup with properties in group and in individual.

"
Class {
	#name : #NeoPyramidPopingPresenterBuilder,
	#superclass : #NeoPyramidPropertyPresenterBuilder,
	#category : #'NeoPyramid-property'
}

{ #category : #'as yet unclassified' }
NeoPyramidPopingPresenterBuilder >> build [

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
		  yourself
]

{ #category : #'as yet unclassified' }
NeoPyramidPopingPresenterBuilder >> buildLayoutAll: presenterAll grouped: presentersGrouped individual: presentersIndividual [

	| presenterPopup buttonPopup |
	presenterPopup := NeoPyramidPropertyPopupPresenter new
		                  name: self property name
		                  grouped: presentersGrouped
		                  individual: presentersIndividual;
		                  yourself.

	buttonPopup := SpButtonPresenter new
		               icon: (self iconNamed: #edit);
		               yourself.

	buttonPopup action: [
		(PyramidPopoverFactory
			 makeWithPresenter: presenterPopup
			 relativeTo: buttonPopup
			 position: SpPopoverPosition left) popup ].

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: (SpLabelPresenter new
				   label: self property name;
				displayBold: [ :t | true ];
				   yourself)
		  height: 24;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: buttonPopup width: 24;
				   add: presenterAll;
				   yourself)
		  height: 24;
		  yourself
]

{ #category : #'as yet unclassified' }
NeoPyramidPopingPresenterBuilder >> buildLayoutOnlyForAll: presenterAll [

	| buttonPopup |
	buttonPopup := SpButtonPresenter new
		               icon: (self iconNamed: #edit);
		               enabled: false;
		               yourself.

	^ SpBoxLayout newVertical
		  spacing: 4;
		  add: (SpLabelPresenter new
				   label: self property name;
					displayBold: [ :t | true ];
				   yourself)
		  height: 24;
		  add: (SpBoxLayout newHorizontal
				   spacing: 4;
				   add: buttonPopup width: 24;
				   add: presenterAll;
				   yourself)
		  height: 24;
		  yourself
]

{ #category : #'as yet unclassified' }
NeoPyramidPopingPresenterBuilder >> buildPresenterAll [

	| input |
	input := self property pyramidInputPresenterClass new.

	self cluster isEmpty ifTrue: [
		input emptyValue.
		^ input ].

	self cluster isTargetsSameArguments
		ifTrue: [ input value: self cluster arguments first ]
		ifFalse: [ input mixedValues ].

	input whenValueChangedDo: [ :value |
		self property commandExecutor
			use: self property command
			on: self cluster allTargets
			with: value ].
	^ input
]

{ #category : #'as yet unclassified' }
NeoPyramidPopingPresenterBuilder >> buildPresenterWithButtonsFor: anAssociation withLabel: aString [

	| input buttonApplyToAll layout |
	input := self property pyramidInputPresenterClass new.
	input value: anAssociation key.
	input whenValueChangedDo: [ :value |
		self property commandExecutor
			use: self property command
			on: anAssociation value
			with: value ].

	buttonApplyToAll := SpButtonPresenter new
		                    icon: (self iconNamed: #smallExpert);
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
NeoPyramidPopingPresenterBuilder >> buildPresentersGrouped [

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
NeoPyramidPopingPresenterBuilder >> buildPresentersIndividual [

	| label |
	self cluster isEmpty ifTrue: [ ^ {  } ].
	^ self cluster individualAssociations collect: [ :each |
		  label := each hash printString.
		  self buildPresenterWithButtonsFor: each withLabel: label ]
]

{ #category : #'as yet unclassified' }
NeoPyramidPopingPresenterBuilder >> layoutForLabel: aString input: anInput button: aButton [

	^ SpBoxLayout newHorizontal spacing: 4; add: aString width: 80; add: anInput; add: aButton width: 24; yourself
]
