Class {
	#name : #PyPropertyStrategySelectionMixed,
	#superclass : #PyPropertyStrategy,
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #testing }
PyPropertyStrategySelectionMixed >> isEditButtonEnabled [

	^ true
]

{ #category : #testing }
PyPropertyStrategySelectionMixed >> isSingleFormEnabled [

	^ true
]

{ #category : #'as yet unclassified' }
PyPropertyStrategySelectionMixed >> updateForm: aView [

	aView singleForm differentsValue.
	aView updatePopover
]
