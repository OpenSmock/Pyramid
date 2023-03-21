Class {
	#name : #PyCommandBackground,
	#superclass : #PyCommand,
	#category : #'Pyramid-test2'
}

{ #category : #execution }
PyCommandBackground >> executeOn: aBlElement [

	aBlElement background: self arguments background
]

{ #category : #accessing }
PyCommandBackground >> mementoClass [

	^ PyMementoBackgrounds 
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
