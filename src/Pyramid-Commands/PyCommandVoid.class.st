Class {
	#name : #PyCommandVoid,
	#superclass : #PyCommand,
	#category : #'Pyramid-Commands-AllCommands'
}

{ #category : #'as yet unclassified' }
PyCommandVoid >> executeOn: aBlElement [
]

{ #category : #'as yet unclassified' }
PyCommandVoid >> printOn: aStream [

	super printOn: aStream.
	aStream << 'Void'.

	self arguments ifNil: [ ^ self ].
	aStream nextPut: $(.
	aStream print: self arguments value.
	aStream nextPut: $)
]

{ #category : #'as yet unclassified' }
PyCommandVoid >> stateOf: aBlElement for: aState [
]
