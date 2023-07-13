Class {
	#name : #NeoPyramidCompositeMemento,
	#superclass : #NeoPyramidAbstractMemento,
	#instVars : [
		'mementos'
	],
	#category : #'NeoPyramid-history'
}

{ #category : #initialization }
NeoPyramidCompositeMemento >> initialize [

	mementos := OrderedCollection new.
]

{ #category : #accessing }
NeoPyramidCompositeMemento >> mementos [

	^ mementos
]

{ #category : #accessing }
NeoPyramidCompositeMemento >> mementos: anObject [

	mementos := anObject
]
