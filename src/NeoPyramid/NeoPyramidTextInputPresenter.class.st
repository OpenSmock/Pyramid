Class {
	#name : #NeoPyramidTextInputPresenter,
	#superclass : #NeoPyramidInputPresenter,
	#instVars : [
		'textInput'
	],
	#category : #'NeoPyramid-property'
}

{ #category : #layout }
NeoPyramidTextInputPresenter >> defaultLayout [

	^ SpBoxLayout newVertical add: self textInput; yourself
]

{ #category : #'as yet unclassified' }
NeoPyramidTextInputPresenter >> emptyValue [

	self value: '# empty value'
]

{ #category : #initialization }
NeoPyramidTextInputPresenter >> initializePresenters [

	textInput := SpTextInputFieldPresenter new
]

{ #category : #'as yet unclassified' }
NeoPyramidTextInputPresenter >> mixedValues [

	self value: '# mixed values'
]

{ #category : #accessing }
NeoPyramidTextInputPresenter >> textInput [

	^ textInput
]

{ #category : #'as yet unclassified' }
NeoPyramidTextInputPresenter >> value [

	self textInput text
]

{ #category : #'as yet unclassified' }
NeoPyramidTextInputPresenter >> value: anObject [

	self textInput text: anObject asString
]

{ #category : #'as yet unclassified' }
NeoPyramidTextInputPresenter >> whenValueChangedDo: aBlock [

	self textInput whenSubmitDo: aBlock
]
