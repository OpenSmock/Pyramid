Class {
	#name : #PyramidTextInputPresenter,
	#superclass : #NeoPyramidInputPresenter,
	#instVars : [
		'textInput'
	],
	#category : #'NeoPyramid-property'
}

{ #category : #layout }
PyramidTextInputPresenter >> defaultLayout [

	^ SpBoxLayout newVertical add: self textInput; yourself
]

{ #category : #'as yet unclassified' }
PyramidTextInputPresenter >> emptyValue [

	self value: '# empty value'
]

{ #category : #initialization }
PyramidTextInputPresenter >> initializePresenters [

	textInput := SpTextInputFieldPresenter new
]

{ #category : #'as yet unclassified' }
PyramidTextInputPresenter >> mixedValues [

	self value: '# mixed values'
]

{ #category : #accessing }
PyramidTextInputPresenter >> textInput [

	^ textInput
]

{ #category : #'as yet unclassified' }
PyramidTextInputPresenter >> value [

	^ self textInput text
]

{ #category : #'as yet unclassified' }
PyramidTextInputPresenter >> value: anObject [

	self textInput text: anObject asString
]

{ #category : #'as yet unclassified' }
PyramidTextInputPresenter >> whenValueChangedDo: aBlock [

	self textInput whenSubmitDo: aBlock
]
