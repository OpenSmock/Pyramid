Class {
	#name : #NeoPyramidCommandExecutor,
	#superclass : #Object,
	#instVars : [
		'history'
	],
	#category : #NeoPyramid
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
	aCollection size ifEmpty: [ ^ self ].

	undoMemento := aCommand saveStatesOf: aCollection.
	aCommand useOn: aCollection with: arguments.
	redoMemento := aCommand saveStatesOf: aCollection.

	self history addUndo: undoMemento.
	self history addRedo: redoMemento
]
