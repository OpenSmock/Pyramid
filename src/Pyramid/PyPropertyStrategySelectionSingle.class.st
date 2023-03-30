Class {
	#name : #PyPropertyStrategySelectionSingle,
	#superclass : #PyPropertyStrategy,
	#instVars : [
		'valueOfForm'
	],
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #'as yet unclassified' }
PyPropertyStrategySelectionSingle >> updateForm: aView [

	aView editButton enabled: false.
	aView singleForm enabled: true.
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
