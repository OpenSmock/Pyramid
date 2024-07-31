"
I can show and edit numbers
"
Class {
	#name : #PyramidNumberInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'inputNumber',
		'submitBlock'
	],
	#category : 'Pyramid-specs-custom'
}

{ #category : #'as yet unclassified' }
PyramidNumberInputPresenter >> applyStrings [

	self inputNumber help: self strings help
]

{ #category : #layout }
PyramidNumberInputPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  add: self inputNumber;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidNumberInputPresenter >> getNumberFrom: aString [

	^ NumberParser parse: aString onError: [ PyramidUnknowState new ]
]

{ #category : #'initialization - deprecated' }
PyramidNumberInputPresenter >> initializePresenters [

	inputNumber := SpTextInputFieldPresenter new whenSubmitDo: [ :text |
			               self submitBlock value: (self getNumberFrom: text) ]; yourself
]

{ #category : #accessing }
PyramidNumberInputPresenter >> inputNumber [
^ inputNumber
]

{ #category : #accessing }
PyramidNumberInputPresenter >> submitBlock [

	submitBlock ifNil: [ submitBlock := [ :n | ] ].
^ submitBlock
]

{ #category : #accessing }
PyramidNumberInputPresenter >> value [

	^ self getNumberFrom: self inputNumber text
]

{ #category : #accessing }
PyramidNumberInputPresenter >> value: aNumber [

	aNumber isNumber ifTrue: [
		self inputNumber text: aNumber asFloat reduce printString.
		^ self ].
	self inputNumber text: '--'
]

{ #category : #accessing }
PyramidNumberInputPresenter >> whenValueChangedDo: aBlock [

	submitBlock := aBlock
]
