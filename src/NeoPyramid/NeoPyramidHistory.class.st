Class {
	#name : #NeoPyramidHistory,
	#superclass : #Object,
	#instVars : [
		'mementosStack',
		'position'
	],
	#category : #'NeoPyramid-history'
}

{ #category : #testing }
NeoPyramidHistory >> canRedo [

	^ self mementosStack size - self position > 0
]

{ #category : #testing }
NeoPyramidHistory >> canUndo [

 ^ self position >= 1
]

{ #category : #initialization }
NeoPyramidHistory >> initialize [

	mementosStack := OrderedCollection new.
	position := 0
]

{ #category : #accessing }
NeoPyramidHistory >> mementosStack [

	^ mementosStack
]

{ #category : #accessing }
NeoPyramidHistory >> mementosStack: anObject [

	mementosStack := anObject
]

{ #category : #accessing }
NeoPyramidHistory >> position [

	^ position
]

{ #category : #'as yet unclassified' }
NeoPyramidHistory >> previous: undoMemento current: redoMemento [

	(self position ~= 0 and: [ self position ~= self mementosStack size ]) ifTrue: [ self mementosStack: (self mementosStack first: self position). ].
	
	position := position + 1.
	self mementosStack add: undoMemento -> redoMemento
]

{ #category : #'menu messages' }
NeoPyramidHistory >> redo [

	self canRedo ifTrue: [
		(self mementosStack at: self position + 1) value restore.
		position := position + 1 ]
]

{ #category : #'menu messages' }
NeoPyramidHistory >> undo [

	self canUndo ifTrue: [
		(self mementosStack at: self position) key restore.
		position := position - 1 ]
]
