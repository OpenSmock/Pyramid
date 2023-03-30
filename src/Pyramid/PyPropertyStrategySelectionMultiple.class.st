Class {
	#name : #PyPropertyStrategySelectionMultiple,
	#superclass : #PyPropertyStrategy,
	#instVars : [
		'valueOfForm'
	],
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #'as yet unclassified' }
PyPropertyStrategySelectionMultiple >> updateForm: aView [

	aView editButton enabled: true.
	aView singleForm enabled: true.
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
