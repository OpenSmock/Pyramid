Class {
	#name : #PyCommandBackground,
	#superclass : #PyCommand,
	#category : #'Pyramid-Commands-Background'
}

{ #category : #execution }
PyCommandBackground >> executeOn: aBlElement [

	aBlElement background: self arguments background
]

{ #category : #accessing }
PyCommandBackground >> mementoClass [

	^ PyMementoBackground 
]

{ #category : #printing }
PyCommandBackground >> printOn: aStream [

	super printOn: aStream.
	aStream << 'Background'.

	self arguments ifNil: [ ^ self ].
	aStream nextPut: $(.
	aStream print: self arguments background.
	aStream nextPut: $)
]

{ #category : #'as yet unclassified' }
PyCommandBackground >> stateOf: aBlElement for: aState [

	aState background: aBlElement background
]
