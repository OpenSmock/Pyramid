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
