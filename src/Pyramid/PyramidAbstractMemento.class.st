Class {
	#name : #PyramidAbstractMemento,
	#superclass : #Object,
	#category : #'Pyramid-history'
}

{ #category : #testing }
PyramidAbstractMemento class >> isAbstract [

	^ self == PyramidAbstractMemento
]

{ #category : #'window management' }
PyramidAbstractMemento >> restore [

	self shouldBeImplemented
]
