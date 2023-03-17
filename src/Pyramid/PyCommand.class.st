Class {
	#name : #PyCommand,
	#superclass : #Object,
	#instVars : [
		'args'
	],
	#category : #'Pyramid-test2'
}

{ #category : #accessing }
PyCommand >> arguments [

	args ifNil: [ args := self defaultArguments ].
	^ args
]

{ #category : #accessing }
PyCommand >> arguments: anArguments [

	args := anArguments
]

{ #category : #accessing }
PyCommand >> defaultArguments [

	^ self shouldBeImplemented
]

{ #category : #execution }
PyCommand >> executeOn: aBlElement [

	self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
PyCommand >> mementoFor: aBlElement [

	| memento |
	memento := self class mementoClass new.
	memento
		element: aBlElement;
		command: self class new.
	self stateOf: aBlElement for: memento.
	^ memento
]

{ #category : #'as yet unclassified' }
PyCommand >> stateOf: aBlElement for: aState [

	^ self shouldBeImplemented
]
