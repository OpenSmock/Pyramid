Class {
	#name : #PyCommandBackground,
	#superclass : #PyCommand,
	#category : #'Pyramid-Commands-AllCommands'
}

{ #category : #execution }
PyCommandBackground >> executeOn: aBlElement [

	aBlElement background: self arguments value
]

{ #category : #printing }
PyCommandBackground >> printOn: aStream [

	super printOn: aStream.
	aStream << 'Background'.

	self arguments ifNil: [ ^ self ].
	aStream nextPut: $(.
	aStream print: self arguments value.
	aStream nextPut: $)
]

{ #category : #'as yet unclassified' }
PyCommandBackground >> stateOf: aBlElement for: aState [

	aState value: aBlElement background
]
