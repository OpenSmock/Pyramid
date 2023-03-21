Class {
	#name : #PyCommandHistoryWithRedo,
	#superclass : #PyCommandHistory,
	#instVars : [
		'cursor',
		'cursorLimit',
		'lastMemento'
	],
	#category : #'Pyramid-test2'
}

{ #category : #'as yet unclassified' }
PyCommandHistoryWithRedo >> add: aMemento [

	mementos add: aMemento.
	cursor := cursor + 1.
	cursorLimit := cursor.
]

{ #category : #'as yet unclassified' }
PyCommandHistoryWithRedo >> initialize [

	super initialize.
	cursor := 1.
	cursorLimit := 1.
]

{ #category : #'undo - undo' }
PyCommandHistoryWithRedo >> redo [

	mementos ifEmpty: [ ^ self ].
	cursor = cursorLimit ifTrue: [ 
		lastMemento restore.
		^ self ].
	(mementos at: cursor) restore.
	cursor := cursor + 1
]

{ #category : #'menu messages' }
PyCommandHistoryWithRedo >> undo [

	mementos ifEmpty: [ ^ self ].
	cursor <= 1 ifTrue: [ ^ self ].
	cursor := cursor - 1.
	(mementos at: cursor) restore
]

{ #category : #'menu messages' }
PyCommandHistoryWithRedo >> useCommand: aCommand onSelection: aSelection [

	| memento mementoSeq |
	super useCommand: aCommand onSelection: aSelection.
	
	mementoSeq := PyMementoSequence new.
	
	aSelection elements do: [ :each | memento := aCommand mementoClass newFrom: aCommand arguments.
		memento element: each.
		memento command: aCommand.
		mementoSeq add: memento ].
	
	lastMemento := mementoSeq
]
