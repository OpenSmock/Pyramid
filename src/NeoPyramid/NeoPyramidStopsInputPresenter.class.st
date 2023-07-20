Class {
	#name : #NeoPyramidStopsInputPresenter,
	#superclass : #NeoPyramidInputPresenter,
	#instVars : [
		'whenValueChangedDo',
		'inputs'
	],
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #removing }
NeoPyramidStopsInputPresenter >> addStopInput: input andPresenter: presenter [

	self inputs add: input -> presenter.
	self updateInputsOrder
]

{ #category : #adding }
NeoPyramidStopsInputPresenter >> addStopInputAfter: anInput [

	| index |
	index := self inputs findBinaryIndex: [ :arg |
		         anInput value key - arg key value key ].
	self insertNewStopInputBetweenIndex: index and: index + 1
]

{ #category : #adding }
NeoPyramidStopsInputPresenter >> addStopInputBefore: anInput [

	| index |
	index := self inputs findBinaryIndex: [ :arg |
		         anInput value key - arg key value key ].
	self insertNewStopInputBetweenIndex: index - 1 and: index
]

{ #category : #layout }
NeoPyramidStopsInputPresenter >> defaultLayout [

	| defaultLayout |
	defaultLayout := SpBoxLayout newVertical
		                 spacing: 4;
		                 yourself.
	self inputs do: [ :each |
		defaultLayout add: each value height: 24 ].
	^ SpScrollableLayout new
		  child: defaultLayout;
		  yourself
]

{ #category : #initialization }
NeoPyramidStopsInputPresenter >> initializePresenters [

	whenValueChangedDo := [ :arr |  ].
	inputs := OrderedCollection new.
	self makeNewStopInput: 0 -> Color black.
	self makeNewStopInput: 1 -> Color white
]

{ #category : #accessing }
NeoPyramidStopsInputPresenter >> inputs [

	^ inputs
]

{ #category : #accessing }
NeoPyramidStopsInputPresenter >> inputs: anObject [

	inputs := anObject
]

{ #category : #adding }
NeoPyramidStopsInputPresenter >> insertNewStopInputBetweenIndex: beforeIndex and: afterIndex [
	"
inputs (size = 1)
before = 0
	ifTrue: [ new at: 0, first at: 1 ]
	ifFalse: [ new at: 1, first at: 0 ]

inputs: [first .. last]
(after > last) -> We add new input with 1.0 and last is moved between before and new
(before < first) -> We add new input with 0.0 and first is moved between after and new
-> We add new between after and before
"

	| beforeInput afterInput |
	self inputs size = 1
		ifTrue: [
			beforeIndex = 0
				ifTrue: [
					afterInput := (self inputs at: afterIndex) key.
					self stopValue: 1.0 for: afterInput.
					self makeNewStopInput: 0.0 -> afterInput value value muchDarker ]
				ifFalse: [
					beforeInput := (self inputs at: beforeIndex) key.
					self stopValue: 0.0 for: afterInput.
					self makeNewStopInput: 1.0 -> afterInput value value muchLighter ] ]
		ifFalse: [
			afterIndex > self inputs size ifTrue: [
				beforeInput := (self inputs at: self inputs size - 1) key.
				self
					stopValue: 1.0 + beforeInput value key / 2
					for: self inputs last key.
				self makeNewStopInput:
					1.0 -> self inputs last key value value muchLighter.
					^self ].
			beforeIndex < 1 ifTrue: [
				afterInput := (self inputs at: 2) key.
				self
					stopValue: afterInput value key / 2
					for: self inputs first key.
				self makeNewStopInput:
					0.0 -> self inputs first key value value muchDarker.
					^self ].
			beforeInput := (self inputs at: beforeIndex) key.
			afterInput := (self inputs at: afterIndex) key.
			self makeNewStopInput:
				beforeInput value key + afterInput value key / 2
				->
				(beforeInput value value mixed: 0.5 with: afterInput value value) ]
]

{ #category : #'as yet unclassified' }
NeoPyramidStopsInputPresenter >> layoutForStopInput: input remove: buttonRemove addBefore: buttonAddBefore addAfter: buttonAddAfter [

	^ SpBoxLayout newHorizontal spacing: 4; add: buttonRemove width: 24; add: input; 
	 add: buttonAddBefore width: 24;
	 add: buttonAddAfter width: 24; yourself
]

{ #category : #'as yet unclassified' }
NeoPyramidStopsInputPresenter >> makeNewStopInput: anAssociation [

	| input buttonRemove buttonAddBefore buttonAddAfter presenter |
	presenter := SpPresenter new.
	input := NeoPyramidColorStopInputPresenter new
		         value: anAssociation;
		         whenValueChangedDo: [ :asso |
			         self updateInputsOrder.
			         self whenValueChangedDo value: self value ];
		         yourself.
	buttonRemove := SpButtonPresenter new
		                icon: (self iconNamed: #smallDelete);
		                help: 'Remove this value from the gradient';
		                action: [
			                self removeStopInput: input andPresenter: presenter ];
		                yourself.
	buttonAddBefore := SpButtonPresenter new
		                   icon: (self iconNamed: #up);
		                   help: 'Add a Stop before this one';
		                   action: [ self addStopInputBefore: input ];
		                   yourself.
	buttonAddAfter := SpButtonPresenter new
		                  icon: (self iconNamed: #down);
		                  help: 'Add a Stop after this one';
		                  action: [ self addStopInputAfter: input ];
		                  yourself.
	presenter
		             layout: (self
				              layoutForStopInput: input
				              remove: buttonRemove
				              addBefore: buttonAddBefore
				              addAfter: buttonAddAfter).

	self addStopInput: input andPresenter: presenter
]

{ #category : #removing }
NeoPyramidStopsInputPresenter >> removeStopInput: input andPresenter: presenter [

	self inputs size = 1 ifTrue: [ ^ self ].
	self inputs remove: input -> presenter.
	self layout: self defaultLayout
]

{ #category : #'as yet unclassified' }
NeoPyramidStopsInputPresenter >> stopValue: aNumber for: anInput [

	anInput value: aNumber -> anInput value value
]

{ #category : #'as yet unclassified' }
NeoPyramidStopsInputPresenter >> updateInputsOrder [

	self inputs:
		(self inputs sort: [ :a :b | a key value key < b key value key ]).
		self layout: self defaultLayout.
]

{ #category : #'as yet unclassified' }
NeoPyramidStopsInputPresenter >> value [

	^ self inputs collect: [ :asso | asso key value ].
]

{ #category : #'as yet unclassified' }
NeoPyramidStopsInputPresenter >> value: aCollection [

	self inputs removeAll.
	aCollection do: [ :each | self makeNewStopInput: each ].
]

{ #category : #accessing }
NeoPyramidStopsInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #accessing }
NeoPyramidStopsInputPresenter >> whenValueChangedDo: anObject [

	whenValueChangedDo := anObject
]
