Class {
	#name : #PyHistoryWithRedo,
	#superclass : #PyHistory,
	#instVars : [
		'cursor',
		'cursorLimit',
		'lastMemento'
	],
	#category : #'Pyramid-test2'
}

{ #category : #'as yet unclassified' }
PyHistoryWithRedo >> add: aMemento [

	mementos add: aMemento.
	cursor := cursor + 1.
	cursorLimit := cursor.
]

{ #category : #'menu messages' }
PyHistoryWithRedo >> do: aCommand on: aSelection [

	super do: aCommand on: aSelection.

	lastMemento := PyMementoSequence new.
	aSelection do: [ :each | 
		lastMemento add: (aCommand mementoFor: each) ]
]

{ #category : #'as yet unclassified' }
PyHistoryWithRedo >> initialize [

	super initialize.
	cursor := 1.
	cursorLimit := 1.
]

{ #category : #'undo - undo' }
PyHistoryWithRedo >> redo [

	mementos ifEmpty: [ ^ self ].
	cursor = cursorLimit ifTrue: [ 
		lastMemento restore.
		^ self ].
	(mementos at: cursor) restore.
	cursor := cursor + 1
]

{ #category : #'menu messages' }
PyHistoryWithRedo >> undo [

	mementos ifEmpty: [ ^ self ].
	cursor <= 1 ifTrue: [ ^ self ].
	cursor := cursor - 1.
	(mementos at: cursor) restore
]
