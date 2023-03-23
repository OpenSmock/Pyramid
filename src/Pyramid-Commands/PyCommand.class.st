Class {
	#name : #PyCommand,
	#superclass : #Object,
	#instVars : [
		'args'
	],
	#category : #'Pyramid-Commands-AllCommands'
}

{ #category : #'as yet unclassified' }
PyCommand class >> isAbstract [

	^ self == PyCommand
]

{ #category : #accessing }
PyCommand >> arguments [

	^ args
]

{ #category : #accessing }
PyCommand >> arguments: anArguments [

	args := anArguments
]

{ #category : #execution }
PyCommand >> executeOn: aBlElement [

	self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
PyCommand >> mementoFor: aBlElement [

	| memento |
	memento := PyMemento new.
	memento
		element: aBlElement;
		command: self class new.
	self stateOf: aBlElement for: memento.
	^ memento
]

{ #category : #printing }
PyCommand >> printOn: aStream [

	aStream << 'PyCommand'
]

{ #category : #'as yet unclassified' }
PyCommand >> stateOf: aBlElement for: aState [

	^ self shouldBeImplemented
]
