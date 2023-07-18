Class {
	#name : #NeoPyramidAbstractMemento,
	#superclass : #Object,
	#category : #'NeoPyramid-history'
}

{ #category : #testing }
NeoPyramidAbstractMemento class >> isAbstract [

	^ self == NeoPyramidAbstractMemento
]

{ #category : #'window management' }
NeoPyramidAbstractMemento >> restore [

	self shouldBeImplemented
]
