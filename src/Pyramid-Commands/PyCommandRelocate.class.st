Class {
	#name : #PyCommandRelocate,
	#superclass : #PyCommand,
	#category : #'Pyramid-Commands-AllCommands'
}

{ #category : #execution }
PyCommandRelocate >> executeOn: aBlElement [

	aBlElement relocate: self arguments value
]

{ #category : #printing }
PyCommandRelocate >> printOn: aStream [

	super printOn: aStream.
	aStream << 'Relocate'.

	self arguments ifNil: [ ^ self ].
	aStream nextPut: $(.
	aStream print: self arguments value.
	aStream nextPut: $)
]

{ #category : #'as yet unclassified' }
PyCommandRelocate >> stateOf: aBlElement for: aState [

	aState value: aBlElement constraints position
]
