Class {
	#name : 'PyramidAbstractMemento',
	#superclass : 'Object',
	#category : 'Pyramid-history',
	#package : 'Pyramid',
	#tag : 'history'
}

{ #category : 'testing' }
PyramidAbstractMemento class >> isAbstract [

	^ self == PyramidAbstractMemento
]

{ #category : 'visiting' }
PyramidAbstractMemento >> accept: aVisitor [

	^ self shouldBeImplemented
]

{ #category : 'window management' }
PyramidAbstractMemento >> restore [

	self shouldBeImplemented
]
