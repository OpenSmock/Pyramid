Class {
	#name : #PyMementoSequence,
	#superclass : #PyMementoAbstract,
	#classTraits : 'TPyMemento classTrait',
	#instVars : [
		'mementos'
	],
	#category : #'Pyramid-Core-Pipeline'
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

{ #category : #'window management' }
PyMementoSequence >> restore: aPipeline [

	mementos reverseDo: [ :each | each restore: aPipeline ]
]
