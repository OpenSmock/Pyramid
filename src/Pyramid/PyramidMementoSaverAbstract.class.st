Class {
	#name : #PyramidMementoSaverAbstract,
	#superclass : #Object,
	#instVars : [
		'pipeline'
	],
	#category : #'Pyramid-plugin-history'
}

{ #category : #adding }
PyramidMementoSaverAbstract >> mementoFor: anObject command: aCommand [

	| command |
	command := aCommand copyWithoutState.
	aCommand getState: command state from: anObject.

	^ PyramidMemento new
		  pipeline: self pipeline;
		  target: anObject;
		  command: command;
		  yourself
]

{ #category : #accessing }
PyramidMementoSaverAbstract >> pipeline [

	^ pipeline
]

{ #category : #accessing }
PyramidMementoSaverAbstract >> pipeline: anObject [

	pipeline := anObject
]

{ #category : #adding }
PyramidMementoSaverAbstract >> saveMemento: aMemento [

	self shouldBeImplemented
]

{ #category : #adding }
PyramidMementoSaverAbstract >> useCommand: aCommand on: anObject [

	| memento |
	memento := PyramidMementoSequence new.
	anObject collection do: [ :each |
		memento add: (self mementoFor: each command: aCommand) ].
	self saveMemento: memento
]
