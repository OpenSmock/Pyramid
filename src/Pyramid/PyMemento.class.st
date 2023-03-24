Class {
	#name : #PyMemento,
	#superclass : #PyMementoAbstract,
	#instVars : [
		'element',
		'command',
		'value'
	],
	#category : #'Pyramid-Plugin-History'
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

{ #category : #'window management' }
PyMemento >> restore: aPipeline [

	aPipeline selection clear.
	aPipeline selection add: self element.
	aPipeline useCommand: (self command arguments: self).
]

{ #category : #'as yet unclassified' }
PyMemento >> value [
	^ value
]

{ #category : #accessing }
PyMemento >> value: anObject [

	value := anObject
]
