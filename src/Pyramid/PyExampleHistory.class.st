Class {
	#name : #PyExampleHistory,
	#superclass : #Object,
	#category : #'Pyramid-Examples'
}

{ #category : #examples }
PyExampleHistory class >> example1 [

	| selection history command commandArgs e1 e2 |
	e1 := BlElement new.
	e2 := BlElement new.

	selection := PySelection new.
	history := PyCommandHistory new.
	command := PyCommandBackground new.
	commandArgs := PyCommandBackgroundArgs new.

	command arguments: commandArgs.

	selection elements add: e1.
	selection elements add: e2.

	commandArgs background: Color random.
	history useCommand: command onSelection: selection.

	commandArgs background: Color random.
	history useCommand: command onSelection: selection.

	history undo
]

{ #category : #examples }
PyExampleHistory class >> example2 [

	| selection history logger executor pipeline command commandArgs e1 e2 |
	e1 := BlElement new.
	e2 := BlElement new.

	selection := PySelection new.
	history := PyCommandHistory new.
	executor := PyCommandExecutor new.
	logger := PyCommandLogger new.
	pipeline := PyPipeline new.

	pipeline add: history.
	pipeline add: logger.
	pipeline add: executor.
	pipeline selection: selection.

	command := PyCommandBackground new.
	commandArgs := PyCommandBackgroundArgs new.
	command arguments: commandArgs.

	selection elements add: e1.
	selection elements add: e2.

	commandArgs background: Color random.
	pipeline useCommand: command.

	history undo
]
