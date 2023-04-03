Class {
	#name : #PyPropertyStrategySelectionMultiple,
	#superclass : #PyPropertyStrategy,
	#instVars : [
		'valueOfForm'
	],
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #testing }
PyPropertyStrategySelectionMultiple >> isEditButtonEnabled [

	^ true
]

{ #category : #testing }
PyPropertyStrategySelectionMultiple >> isSingleFormEnabled [

	^ true
]

{ #category : #'as yet unclassified' }
PyPropertyStrategySelectionMultiple >> updateForm: aView [

	aView singleForm currentValue: self valueOfForm.
	aView updatePopover
]

{ #category : #'as yet unclassified' }
PyPropertyStrategySelectionMultiple >> valueOfForm [

	^ valueOfForm value
]

{ #category : #'as yet unclassified' }
PyPropertyStrategySelectionMultiple >> valueOfForm: anObject [

	valueOfForm := anObject
]
