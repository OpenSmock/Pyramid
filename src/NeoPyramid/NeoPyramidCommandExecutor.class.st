"
I execute the command on the given targets with the given arguments.

I’m an abstract class use to define the API.

"
Class {
	#name : #NeoPyramidCommandExecutor,
	#superclass : #Object,
	#category : #'NeoPyramid-command'
}

{ #category : #testing }
NeoPyramidCommandExecutor class >> isAbstract [

	^ self == NeoPyramidCommandExecutor
]

{ #category : #'as yet unclassified' }
NeoPyramidCommandExecutor >> use: aCommand on: aCollection with: arguments [

	self shouldBeImplemented
]
