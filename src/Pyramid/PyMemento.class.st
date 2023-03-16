Class {
	#name : #PyMemento,
	#superclass : #Object,
	#instVars : [
		'element',
		'command'
	],
	#category : #'Pyramid-test2'
}

{ #category : #accessing }
PyMemento >> command [

	^ command
]

{ #category : #accessing }
PyMemento >> command: aPyCommand [

	command := aPyCommand
]

{ #category : #accessing }
PyMemento >> element [

	^ element
]

{ #category : #accessing }
PyMemento >> element: aBlElement [

	element := aBlElement
]

{ #category : #'window management' }
PyMemento >> restore [

	(self command arguments: self) executeOn: self element
]
