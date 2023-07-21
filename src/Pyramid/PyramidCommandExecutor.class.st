"
I execute the command on the given targets with the given arguments.

I’m an abstract class use to define the API.

"
Class {
	#name : #PyramidCommandExecutor,
	#superclass : #Object,
	#category : #'Pyramid-commands'
}

{ #category : #testing }
PyramidCommandExecutor class >> isAbstract [

	^ self == PyramidCommandExecutor
]

{ #category : #'as yet unclassified' }
PyramidCommandExecutor >> use: aCommand on: aCollection with: arguments [

	self shouldBeImplemented
]
