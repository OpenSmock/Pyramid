Class {
	#name : #PyCommandIdentifier,
	#superclass : #PyCommand,
	#category : #'Pyramid-Commands-AllCommands'
}

{ #category : #'as yet unclassified' }
PyCommandIdentifier class >> mementoClass [

	^ PyPropertyStateIdentifier
]

{ #category : #execution }
PyCommandIdentifier >> executeOn: aBlElement [

	aBlElement id: self arguments value
]

{ #category : #printing }
PyCommandIdentifier >> printOn: aStream [

	super printOn: aStream.
	aStream << 'Identifier'.

	self arguments ifNil: [ ^ self ].
	aStream nextPut: $(.
	aStream print: self arguments value.
	aStream nextPut: $)
]

{ #category : #'as yet unclassified' }
PyCommandIdentifier >> stateOf: aBlElement for: aState [

	aState value: aBlElement id
]
