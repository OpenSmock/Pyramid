Class {
	#name : #PyMementoSequence,
	#superclass : #Object,
	#instVars : [
		'mementos'
	],
	#category : #'Pyramid-test2'
}

{ #category : #accessing }
PyMementoSequence >> add: aMemento [

	mementos add: aMemento.
]

{ #category : #initialization }
PyMementoSequence >> initialize [ 

	mementos := OrderedCollection new.
]

{ #category : #accessing }
PyMementoSequence >> mementos [

	^ mementos
]

{ #category : #'window management' }
PyMementoSequence >> restore [

	mementos reverseDo: [ :each | each restore ].
]
