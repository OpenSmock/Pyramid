Class {
	#name : #PyCommandVisibility,
	#superclass : #PyCommand,
	#category : #'Pyramid-Commands-AllCommands'
}

{ #category : #execution }
PyCommandVisibility >> executeOn: aBlElement [

	aBlElement visibility: self arguments value
]

{ #category : #printing }
PyCommandVisibility >> printOn: aStream [

	super printOn: aStream.
	aStream << 'Visibility'.

	self arguments ifNil: [ ^ self ].
	aStream nextPut: $(.
	aStream print: self arguments value.
	aStream nextPut: $)
]

{ #category : #'as yet unclassified' }
PyCommandVisibility >> stateOf: aBlElement for: aState [

	aState value: aBlElement visibility
]
