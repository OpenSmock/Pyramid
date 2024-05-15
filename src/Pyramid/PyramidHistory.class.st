Class {
	#name : 'PyramidHistory',
	#superclass : 'Object',
	#instVars : [
		'mementosStack',
		'position'
	],
	#category : 'Pyramid-history',
	#package : 'Pyramid',
	#tag : 'history'
}

{ #category : 'testing' }
PyramidHistory >> canRedo [

	^ self mementosStack size - self position > 0
]

{ #category : 'testing' }
PyramidHistory >> canUndo [

 ^ self position >= 1
]

{ #category : 'initialization' }
PyramidHistory >> initialize [

	mementosStack := OrderedCollection new.
	position := 0
]

{ #category : 'accessing' }
PyramidHistory >> mementosStack [

	^ mementosStack
]

{ #category : 'accessing' }
PyramidHistory >> mementosStack: anObject [

	mementosStack := anObject
]

{ #category : 'accessing' }
PyramidHistory >> position [

	^ position
]

{ #category : 'as yet unclassified' }
PyramidHistory >> previous: undoMemento current: redoMemento [

	(self position ~= 0 and: [ self position ~= self mementosStack size ]) ifTrue: [ self mementosStack: (self mementosStack first: self position). ].
	
	position := position + 1.
	self mementosStack add: undoMemento -> redoMemento
]

{ #category : 'menu messages' }
PyramidHistory >> redo [

	self canRedo ifTrue: [
		(self mementosStack at: self position + 1) value restore.
		position := position + 1 ]
]

{ #category : 'menu messages' }
PyramidHistory >> undo [

	self canUndo ifTrue: [
		(self mementosStack at: self position) key restore.
		position := position - 1 ]
]
