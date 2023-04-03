Class {
	#name : #PyPropertyStrategySelectionSingle,
	#superclass : #PyPropertyStrategy,
	#instVars : [
		'valueOfForm'
	],
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #testing }
PyPropertyStrategySelectionSingle >> isEditButtonEnabled [

	^ false
]

{ #category : #testing }
PyPropertyStrategySelectionSingle >> isSingleFormEnabled [

	^ true
]

{ #category : #'as yet unclassified' }
PyPropertyStrategySelectionSingle >> updateForm: aView [

	aView singleForm currentValue: self valueOfForm
]

{ #category : #'as yet unclassified' }
PyPropertyStrategySelectionSingle >> valueOfForm [

	^ valueOfForm value
]

{ #category : #accessing }
PyPropertyStrategySelectionSingle >> valueOfForm: anObject [

	valueOfForm := anObject
]
