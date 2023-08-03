Class {
	#name : #PyramidColorInputSingleLineWithPickupButtonPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'singleLineInput',
		'button',
		'multiLinesInput',
		'whenValueChangedDo'
	],
	#category : #'Pyramid-specs-custom'
}

{ #category : #accessing }
PyramidColorInputSingleLineWithPickupButtonPresenter >> button [

	^ button
]

{ #category : #layout }
PyramidColorInputSingleLineWithPickupButtonPresenter >> defaultLayout [

	^ SpBoxLayout newVertical add: (SpBoxLayout newHorizontal
		  spacing: 2;
		  add: self singleLineInput;
		  add: self button width: 24;
		  yourself) height: 24
]

{ #category : #initialization }
PyramidColorInputSingleLineWithPickupButtonPresenter >> initializePresenters [

	whenValueChangedDo := [ :color |  ].
	multiLinesInput := PyramidColorInputMultiLinesPresenter new.
	singleLineInput := PyramidColorInputSingleLinePresenter new.
	button := SpButtonPresenter new
		          action: [ self openMultiLinesModal ];
		          icon: (self iconNamed: #haloRecolor);
		          yourself.

	singleLineInput whenValueChangedDo: [ :color |
		multiLinesInput value: color.
		self whenValueChangedDo value: color ].

	self value: Color red
]

{ #category : #accessing }
PyramidColorInputSingleLineWithPickupButtonPresenter >> multiLinesInput [

	^ multiLinesInput
]

{ #category : #initialization }
PyramidColorInputSingleLineWithPickupButtonPresenter >> openMultiLinesModal [

	| dialog color |
	dialog := multiLinesInput openModal.
	dialog title: 'Pickup a Color'.
	dialog isOk ifTrue: [ 
		color :=  self multiLinesInput value.
		self singleLineInput value: color. self whenValueChangedDo value:color. ] ifFalse: [
		self multiLinesInput value: self singleLineInput value.
		 ]
]

{ #category : #accessing }
PyramidColorInputSingleLineWithPickupButtonPresenter >> singleLineInput [

	^ singleLineInput
]

{ #category : #'as yet unclassified' }
PyramidColorInputSingleLineWithPickupButtonPresenter >> value [

	^ self singleLineInput value
]

{ #category : #'as yet unclassified' }
PyramidColorInputSingleLineWithPickupButtonPresenter >> value: aColor [

	self singleLineInput value: aColor.
	self multiLinesInput value: aColor 
]

{ #category : #accessing }
PyramidColorInputSingleLineWithPickupButtonPresenter >> whenValueChangedDo [

	^ whenValueChangedDo
]

{ #category : #'as yet unclassified' }
PyramidColorInputSingleLineWithPickupButtonPresenter >> whenValueChangedDo: anObject [

	whenValueChangedDo := anObject
]
