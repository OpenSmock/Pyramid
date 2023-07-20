"
i can show and edit text

"
Class {
	#name : #PyramidTextInputPresenter,
	#superclass : #NeoPyramidInputPresenter,
	#instVars : [
		'textInput'
	],
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #'as yet unclassified' }
PyramidTextInputPresenter >> applyModel [

	self textInput help: self model help
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
