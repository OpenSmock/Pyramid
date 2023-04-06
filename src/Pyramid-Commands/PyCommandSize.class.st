Class {
	#name : #PyCommandSize,
	#superclass : #PyCommand,
	#category : #'Pyramid-Commands-AllCommands'
}

{ #category : #execution }
PyCommandSize >> executeOn: aBlElement [

	aBlElement size: self arguments value
]

{ #category : #printing }
PyCommandSize >> printOn: aStream [

	super printOn: aStream.
	aStream << 'Size'.

	self arguments ifNil: [ ^ self ].
	aStream nextPut: $(.
	aStream print: self arguments value.
	aStream nextPut: $)
]

{ #category : #'as yet unclassified' }
PyCommandSize >> stateOf: aBlElement for: aState [

	| x y |
	
	aBlElement constraints horizontal resizer isFitContent ifTrue: [x := -1 ] ifFalse: [ x := aBlElement constraints horizontal resizer size. ].
	aBlElement constraints vertical resizer isFitContent ifTrue: [y := -1 ] ifFalse: [ 	y := aBlElement constraints vertical resizer size. ].

	aState value: x @ y
]
