Class {
	#name : #NeoPyramidCommandExecutor,
	#superclass : #Object,
	#instVars : [
		'history'
	],
	#category : #'NeoPyramid-command'
}

{ #category : #accessing }
NeoPyramidCommandExecutor >> history [

	^ history
]

{ #category : #initialization }
NeoPyramidCommandExecutor >> initialize [
	history := NeoPyramidHistory new.
]

{ #category : #'as yet unclassified' }
NeoPyramidCommandExecutor >> use: aCommand on: aCollection with: arguments [

	| undoMemento redoMemento |
	"
	1. we create the undo memento of the used command.
	3. we use the command
	2. we create the redo memento.
	"
	aCollection ifEmpty: [ ^ self ].

	undoMemento := aCommand saveStatesWithCommandInverseOf: aCollection with: arguments.
	aCommand useOn: aCollection with: arguments.
	redoMemento := aCommand saveStatesOf: aCollection with: arguments.

	self history previous: undoMemento current: redoMemento
]
