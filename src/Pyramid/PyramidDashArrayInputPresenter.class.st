Class {
	#name : #PyramidDashArrayInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'submitBlock',
		'inputArray'
	],
	#category : #'Pyramid-specs-custom'
}

{ #category : #'as yet unclassified' }
PyramidDashArrayInputPresenter >> applyStrings [

	self inputArray help: self strings help
]

{ #category : #'as yet unclassified' }
PyramidDashArrayInputPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  add: self inputArray;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidDashArrayInputPresenter >> getArrayFrom: aString [

	| numbersAsString |
	numbersAsString := aString substrings.

	^ numbersAsString collect: [ :each |
		  NumberParser parse: each onError: [ ^ PyramidUnknowState new ] ]
]

{ #category : #'as yet unclassified' }
PyramidDashArrayInputPresenter >> initializePresenters [

	inputArray := SpTextInputFieldPresenter new
		              whenSubmitDo: [ :text |
			              self submitBlock value: (self getArrayFrom: text) ];
		              yourself
]

{ #category : #'as yet unclassified' }
PyramidDashArrayInputPresenter >> inputArray [

	^ inputArray
]

{ #category : #'as yet unclassified' }
PyramidDashArrayInputPresenter >> submitBlock [

	submitBlock ifNil: [ submitBlock := [ :n |  ] ].
	^ submitBlock
]

{ #category : #'as yet unclassified' }
PyramidDashArrayInputPresenter >> value [

	^ self getArrayFrom: self inputArray text
]

{ #category : #'as yet unclassified' }
PyramidDashArrayInputPresenter >> value: aCollection [

	aCollection isCollection ifFalse: [
		self inputArray text: '@ Unknown'.
		^ self ].
	self inputArray text: (Character space join:
			 (aCollection collect: [ :number |
				  number asFloat reduce printString ]))
]

{ #category : #'as yet unclassified' }
PyramidDashArrayInputPresenter >> whenValueChangedDo: aBlock [

	submitBlock := aBlock
]
