Class {
	#name : #PyCommandIdentifier,
	#superclass : #PyCommand2,
	#category : #'Pyramid-test'
}

{ #category : #'as yet unclassified' }
PyCommandIdentifier class >> mementoClass [

	^ PyPropertyStateIdentifier
]

{ #category : #execution }
PyCommandIdentifier >> executeOn: aBlElement [

	aBlElement id: self state identifier
]
