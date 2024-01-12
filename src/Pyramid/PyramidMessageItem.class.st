Class {
	#name : #PyramidMessageItem,
	#superclass : #Object,
	#category : #'Pyramid-views'
}

{ #category : #adding }
PyramidMessageItem >> addOnLayout: aLayout [

	self shouldBeImplemented
]

{ #category : #converting }
PyramidMessageItem >> asPyramidMessage [

	^ self
]
