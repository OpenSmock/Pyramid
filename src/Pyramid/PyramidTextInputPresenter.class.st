"
i can show and edit text

"
Class {
	#name : #PyramidTextInputPresenter,
	#superclass : #PyramidInputPresenter,
	#instVars : [
		'textInput'
	],
	#category : #'Pyramid-specs-custom'
}

{ #category : #'as yet unclassified' }
PyramidTextInputPresenter >> applyStrings [

	self textInput help: self strings help
]

{ #category : #layout }
PyramidTextInputPresenter >> defaultLayout [

	^ SpBoxLayout newVertical add: self textInput; yourself
]

{ #category : #initialization }
PyramidTextInputPresenter >> initializePresenters [

	textInput := SpTextInputFieldPresenter new
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

	self textInput whenSubmitDo: aBlock.

]
