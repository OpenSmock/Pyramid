Class {
	#name : #PyPropertyStateIdentifierMemento,
	#superclass : #PyPropertyStateIdentifier,
	#traits : 'TPyMemento',
	#classTraits : 'TPyMemento classTrait',
	#category : #'Pyramid-test'
}

{ #category : #'as yet unclassified' }
PyPropertyStateIdentifierMemento >> commandClass [

	^ PyCommandIdentifier
]

{ #category : #'as yet unclassified' }
PyPropertyStateIdentifierMemento >> stateOf: aBlElement [

	identifier := aBlElement id
]
