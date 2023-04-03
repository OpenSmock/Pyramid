Class {
	#name : #PyPropertyStrategySelectionEmpty,
	#superclass : #PyPropertyStrategy,
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #testing }
PyPropertyStrategySelectionEmpty >> isEditButtonEnabled [

	^ false
]

{ #category : #testing }
PyPropertyStrategySelectionEmpty >> isSingleFormEnabled [

	^ false
]

{ #category : #'as yet unclassified' }
PyPropertyStrategySelectionEmpty >> updateForm: aView [

	aView singleForm emptyValue
]
