Class {
	#name : #PyCommand2Background,
	#superclass : #PyCommand2,
	#category : #'Pyramid-test'
}

{ #category : #'as yet unclassified' }
PyCommand2Background class >> mementoClass [

	^ PyPropertyStateBackground
]

{ #category : #execution }
PyCommand2Background >> executeOn: aBlElement [

	aBlElement background: self state background
]
