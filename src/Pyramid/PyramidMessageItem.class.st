Class {
	#name : #PyramidMessageItem,
	#superclass : #Object,
	#category : #'Pyramid-views'
}

{ #category : #comparing }
PyramidMessageItem >> <= aPyramidMessageItems [

	^ true.
]

{ #category : #adding }
PyramidMessageItem >> addOnLayout: aLayout [

	self shouldBeImplemented
]

{ #category : #converting }
PyramidMessageItem >> asPyramidMessage [

	^ self
]
