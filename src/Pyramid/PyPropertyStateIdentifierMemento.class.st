Class {
	#name : #PyPropertyStateIdentifierMemento,
	#superclass : #PyPropertyStateIdentifier,
	#traits : 'TPyMementoDeprecated',
	#classTraits : 'TPyMementoDeprecated classTrait',
	#category : #'Pyramid-test'
}

{ #category : #'as yet unclassified' }
PyPropertyStateIdentifierMemento >> commandClass [

	^ PyCommand2Identifier
]

{ #category : #'as yet unclassified' }
PyPropertyStateIdentifierMemento >> stateOf: aBlElement [

	identifier := aBlElement id
]
