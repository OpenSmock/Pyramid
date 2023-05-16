Class {
	#name : #PyramidNumberPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'inputNumber',
		'submitBlock'
	],
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #layout }
PyramidNumberPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  add: self inputNumber;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidNumberPresenter >> getNumberFrom: aString [

	^ NumberParser parse: aString onError: [ nil ]
]

{ #category : #'initialization - deprecated' }
PyramidNumberPresenter >> initializePresenter [

	inputNumber := SpTextInputFieldPresenter new
		               whenSubmitDo: [ :text |
			               self submitBlock value: (self getNumberFrom: text) ];
		               text: '0';
		               yourself
]

{ #category : #accessing }
PyramidNumberPresenter >> inputNumber [
^ inputNumber
]

{ #category : #accessing }
PyramidNumberPresenter >> number [

	^ self getNumberFrom: self inputNumber text
]

{ #category : #accessing }
PyramidNumberPresenter >> number: aNumber [

	aNumber ifNil: [ self inputNumber text: '--'. ^ self ].
	self inputNumber text: aNumber asFloat printString
]

{ #category : #accessing }
PyramidNumberPresenter >> submitBlock [

	submitBlock ifNil: [ submitBlock := [ :n | ] ].
^ submitBlock
]

{ #category : #accessing }
PyramidNumberPresenter >> whenSubmitDo: aBlock [

 submitBlock := aBlock
]
