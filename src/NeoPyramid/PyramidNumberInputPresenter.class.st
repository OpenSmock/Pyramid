Class {
	#name : #PyramidNumberInputPresenter,
	#superclass : #NeoPyramidInputPresenter,
	#instVars : [
		'inputNumber',
		'submitBlock'
	],
	#category : #'NeoPyramid-property'
}

{ #category : #layout }
PyramidNumberInputPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  add: self inputNumber;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidNumberInputPresenter >> emptyValue [

	self value: nil
]

{ #category : #'as yet unclassified' }
PyramidNumberInputPresenter >> getNumberFrom: aString [

	^ NumberParser parse: aString onError: [ nil ]
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

{ #category : #'as yet unclassified' }
PyramidNumberInputPresenter >> mixedValues [

	self value: nil
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

	aNumber ifNil: [
		self inputNumber text: '--'.
		^ self ].
	self inputNumber text: aNumber asFloat printString
]

{ #category : #accessing }
PyramidNumberInputPresenter >> whenValueChangedDo: aBlock [

	submitBlock := aBlock
]
