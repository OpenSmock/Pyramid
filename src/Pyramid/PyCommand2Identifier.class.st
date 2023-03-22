Class {
	#name : #PyCommand2Identifier,
	#superclass : #PyCommand2,
	#category : #'Pyramid-test'
}

{ #category : #'as yet unclassified' }
PyCommand2Identifier class >> mementoClass [

	^ PyPropertyStateIdentifier
]

{ #category : #execution }
PyCommand2Identifier >> executeOn: aBlElement [

	aBlElement id: self state identifier
]
