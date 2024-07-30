Class {
	#name : #PyramidPointInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'inputX',
		'inputY',
		'whenValueChangedDo',
		'labelX',
		'labelY'
	],
	#category : 'Pyramid-specs-custom'
}

{ #category : #accessing }
PyramidPointInputPresenter class >> stringsClass [

	^ PyramidPointInputStrings
]

{ #category : #'as yet unclassified' }
PyramidPointInputPresenter >> applyStrings [

	self inputX inputNumber help: self strings help.
	self inputY inputNumber help: self strings help.
	self labelX label: self strings labelX.
	self labelY label: self strings labelY
]

{ #category : #layout }
PyramidPointInputPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  spacing: 4;
		  vAlignCenter;
		  add: self labelX expand: false;
		  add: self inputX expand: true;
		  add: '|' expand: false;
		  add: self labelY expand: false;
		  add: self inputY expand: true;
		  yourself
]

{ #category : #initialization }
PyramidPointInputPresenter >> initializePresenters [

	inputX := PyramidNumberInputPresenter new
		          whenValueChangedDo: [ :n |
			          self whenValueChangedDo value: self value ];
		          yourself.
	inputY := PyramidNumberInputPresenter new
		          whenValueChangedDo: [ :n |
			          self whenValueChangedDo value: self value ];
		          yourself.
	labelX := SpLabelPresenter new.
	labelY := SpLabelPresenter new
]

{ #category : #accessing }
PyramidPointInputPresenter >> inputX [

	^ inputX
]

{ #category : #accessing }
PyramidPointInputPresenter >> inputY [

	^ inputY
]

{ #category : #accessing }
PyramidPointInputPresenter >> labelX [

	^ labelX
]

{ #category : #accessing }
PyramidPointInputPresenter >> labelY [

	^ labelY
]

{ #category : #'as yet unclassified' }
PyramidPointInputPresenter >> value [

	| x y |
	x := self inputX value.
	y := self inputY value.
	x isNumber ifFalse: [ ^ PyramidUnknowState new ].
	y isNumber ifFalse: [ ^ PyramidUnknowState new ].
	^ x @ y
]

{ #category : #'as yet unclassified' }
PyramidPointInputPresenter >> value: aPoint [

	aPoint isPoint ifTrue: [
	self inputX value: aPoint x.
	self inputY value: aPoint y. ^ self ].

		self inputX value: nil.
		self inputY value: nil.
]

{ #category : #accessing }
PyramidPointInputPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #accessing }
PyramidPointInputPresenter >> whenValueChangedDo: anObject [

	whenValueChangedDo := anObject
]
