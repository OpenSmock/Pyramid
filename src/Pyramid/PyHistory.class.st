Class {
	#name : #PyHistory,
	#superclass : #Object,
	#instVars : [
		'mementos'
	],
	#category : #'Pyramid-test2'
}

{ #category : #adding }
PyHistory >> add: aMemento [

	mementos add: aMemento.
]

{ #category : #'menu messages' }
PyHistory >> do: aCommand on: aSelection [

	| memento |
	memento := PyMementoSequence new.
	aSelection do: [ :each | 
		memento add: (aCommand mementoFor: each).
		 ].
	self add: memento.
	aSelection do: [ :each | aCommand executeOn: each ]
]

{ #category : #initialization }
PyHistory >> initialize [

	mementos := OrderedCollection new.
]

{ #category : #'menu messages' }
PyHistory >> undo [

	mementos ifEmpty: [ ^ self ].
	mementos removeLast restore
]
