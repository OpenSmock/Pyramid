Class {
	#name : #PyramidNumberArrayInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'submitBlock',
		'inputArray'
	],
	#category : #'Pyramid-specs-custom'
}

{ #category : #'as yet unclassified' }
PyramidNumberArrayInputPresenter >> applyInputModel [

	self inputArray help: self inputModel help
]

{ #category : #'as yet unclassified' }
PyramidNumberArrayInputPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  add: self inputArray;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidNumberArrayInputPresenter >> getArrayFrom: aString [

	| numbersAsString |
	numbersAsString := aString substrings.
	(#(1 2 4) includes: numbersAsString size) ifFalse: [ ^  PyramidUnknowState new ].
	
	^ numbersAsString collect: [ :each |
		  NumberParser parse: each onError: [ ^ PyramidUnknowState new ] ]
]

{ #category : #'as yet unclassified' }
PyramidNumberArrayInputPresenter >> initializePresenters [

	inputArray := SpTextInputFieldPresenter new
		              whenSubmitDo: [ :text |
			              self submitBlock value: (self getArrayFrom: text) ];
		              yourself
]

{ #category : #'as yet unclassified' }
PyramidNumberArrayInputPresenter >> inputArray [

	^ inputArray
]

{ #category : #'as yet unclassified' }
PyramidNumberArrayInputPresenter >> submitBlock [

	submitBlock ifNil: [ submitBlock := [ :n |  ] ].
	^ submitBlock
]

{ #category : #'as yet unclassified' }
PyramidNumberArrayInputPresenter >> value [

	^ self getArrayFrom: self inputArray text
]

{ #category : #'as yet unclassified' }
PyramidNumberArrayInputPresenter >> value: aCollection [

	aCollection isCollection ifFalse: [
		self inputArray text: '@ Unknown'.
		^ self ].
	(#(1 2 4) includes: aCollection size) ifFalse: [
		self inputArray text: '@ Unknown'.
		^ self ].
	self inputArray text: (Character space join: (aCollection collect: [ :number | number asFloat reduce printString ]))
	
]

{ #category : #'as yet unclassified' }
PyramidNumberArrayInputPresenter >> whenValueChangedDo: aBlock [

	submitBlock := aBlock
]
