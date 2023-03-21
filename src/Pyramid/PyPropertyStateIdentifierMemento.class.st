Class {
	#name : #PyPropertyStateIdentifierMemento,
	#superclass : #PyPropertyStateIdentifier,
	#traits : 'TPyMementoDeprecated',
	#classTraits : 'TPyMementoDeprecated classTrait',
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
