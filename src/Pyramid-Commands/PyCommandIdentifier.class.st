Class {
	#name : #PyCommandIdentifier,
	#superclass : #PyCommand,
	#category : #'Pyramid-Commands-Identifier'
}

{ #category : #execution }
PyCommandIdentifier >> executeOn: aBlElement [

	aBlElement id: self arguments identifier
]

{ #category : #accessing }
PyCommandIdentifier >> mementoClass [

	^ PyMementoIdentifier
]

{ #category : #printing }
PyCommandIdentifier >> printOn: aStream [

	super printOn: aStream.
	aStream << 'Identifier'.

	self arguments ifNil: [ ^ self ].
	aStream nextPut: $(.
	aStream print: self arguments identifier.
	aStream nextPut: $)
]

{ #category : #'as yet unclassified' }
PyCommandIdentifier >> stateOf: aBlElement for: aState [

	aState identifier: aBlElement id
]
