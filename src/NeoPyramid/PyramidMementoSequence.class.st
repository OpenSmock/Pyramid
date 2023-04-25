Class {
	#name : #PyramidMementoSequence,
	#superclass : #PyramidMementoAbstract,
	#instVars : [
		'mementos'
	],
	#category : #'NeoPyramid-plugin-history'
}

{ #category : #adding }
PyramidMementoSequence >> add: aMemento [

	self mementos add: aMemento
]

{ #category : #accessing }
PyramidMementoSequence >> initialize [ 

	mementos := OrderedCollection new.
]

{ #category : #accessing }
PyramidMementoSequence >> mementos [
	^ mementos
]

{ #category : #accessing }
PyramidMementoSequence >> pipeline: anObject [

	super pipeline: anObject.
	self mementos do: [ :each | each pipeline: anObject ]
]

{ #category : #'window management' }
PyramidMementoSequence >> restore [

	self mementos do: [ :each | each restore ]
]
