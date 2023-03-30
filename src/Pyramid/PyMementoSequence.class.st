Class {
	#name : #PyMementoSequence,
	#superclass : #PyMementoAbstract,
	#instVars : [
		'mementos'
	],
	#category : #'Pyramid-Plugin-History'
}

{ #category : #accessing }
PyMementoSequence >> add: aMemento [

	mementos add: aMemento.
]

{ #category : #initialization }
PyMementoSequence >> initialize [ 

	mementos := OrderedCollection new.
]

{ #category : #testing }
PyMementoSequence >> isSequence [

	^ true
]

{ #category : #accessing }
PyMementoSequence >> mementos [

	^ mementos
]

{ #category : #'window management' }
PyMementoSequence >> restore [

	mementos reverseDo: [ :each | each restore ].
]

{ #category : #'window management' }
PyMementoSequence >> restore: aPipeline [

	mementos reverseDo: [ :each | each restore: aPipeline ]
]
