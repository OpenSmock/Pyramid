"
I’m a decorator use to save the history of Pyramid.

"
Class {
	#name : #PyramidHistoryCommandExecutor,
	#superclass : #PyramidCommandExecutorDecorator,
	#instVars : [
		'history'
	],
	#category : #'NeoPyramid-command'
}

{ #category : #accessing }
PyramidHistoryCommandExecutor >> history [

	^ history
]

{ #category : #accessing }
PyramidHistoryCommandExecutor >> history: aPyramidHistory [

	history := aPyramidHistory
]

{ #category : #'as yet unclassified' }
PyramidHistoryCommandExecutor >> use: aCommand on: aCollection with: arguments [

	| undoMemento redoMemento |
	"
	1. we create the undo memento of the used command.
	3. we use the command
	2. we create the redo memento.
	"
	aCollection ifEmpty: [ ^ self ].

	undoMemento := aCommand
		               saveStatesWithCommandInverseOf: aCollection
		               with: arguments.
	self wrappee use: aCommand on: aCollection with: arguments.
	redoMemento := aCommand saveStatesOf: aCollection with: arguments.

	self history previous: undoMemento current: redoMemento
]
