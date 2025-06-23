Class {
	#name : #PyramidNumberFilterOnlyDigitsInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'inputNumber',
		'submitBlock',
		'defaultValue'
	],
	#category : #'Pyramid-specs-custom'
}

{ #category : #'as yet unclassified' }
PyramidNumberFilterOnlyDigitsInputPresenter >> applyInputModel [

	self inputNumber help: self inputModel help
]

{ #category : #layout }
PyramidNumberFilterOnlyDigitsInputPresenter >> defaultLayout [

	^ SpBoxLayout newHorizontal
		  add: self inputNumber;
		  yourself
]

{ #category : #accessing }
PyramidNumberFilterOnlyDigitsInputPresenter >> defaultValue [

	^ defaultValue
]

{ #category : #accessing }
PyramidNumberFilterOnlyDigitsInputPresenter >> defaultValue: aValue [

	defaultValue := aValue
]

{ #category : #'as yet unclassified' }
PyramidNumberFilterOnlyDigitsInputPresenter >> getNumberFrom: aString [

	^ NumberParser parse: aString onError: [ PyramidUnknowState new ]
]

{ #category : #initialization }
PyramidNumberFilterOnlyDigitsInputPresenter >> initializePresenters [

	| newText |
	inputNumber := SpTextInputFieldPresenter new whenSubmitDo: [ :text |
		               newText := text isEmpty
			                          ifTrue: [ self defaultValue asString ]
			                          ifFalse: [
			                          AlbTextEditorDigitInputFilter new
				                          filter: text ].
		               newText value asNumber = 0 ifTrue: [
			               newText := self defaultValue asString ].
		               self submitBlock value: (self getNumberFrom: newText).
		               self inputNumber text: newText ]
]

{ #category : #accessing }
PyramidNumberFilterOnlyDigitsInputPresenter >> inputNumber [
^ inputNumber
]

{ #category : #accessing }
PyramidNumberFilterOnlyDigitsInputPresenter >> submitBlock [

	submitBlock ifNil: [ submitBlock := [ :n | ] ].
^ submitBlock
]

{ #category : #'as yet unclassified' }
PyramidNumberFilterOnlyDigitsInputPresenter >> value [

	^ self getNumberFrom: self inputNumber text
]

{ #category : #'as yet unclassified' }
PyramidNumberFilterOnlyDigitsInputPresenter >> value: aNumber [

	aNumber isNumber ifTrue: [
		self inputNumber text: aNumber asFloat reduce printString.
		^ self ].
	self inputNumber text: '--'
]

{ #category : #'as yet unclassified' }
PyramidNumberFilterOnlyDigitsInputPresenter >> whenValueChangedDo: aBlock [

	submitBlock := aBlock
]
