Class {
	#name : #PyPropertyStrategySelectionEmpty,
	#superclass : #PyPropertyStrategy,
	#category : #'Pyramid-Editor-Properties'
}

{ #category : #'as yet unclassified' }
PyPropertyStrategySelectionEmpty >> updateForm: aView [

	aView editButton enabled: false.
	aView singleForm enabled: false.
	aView singleForm emptyValue
]
