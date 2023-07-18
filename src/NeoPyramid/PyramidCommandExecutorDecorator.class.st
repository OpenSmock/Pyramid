Class {
	#name : #PyramidCommandExecutorDecorator,
	#superclass : #NeoPyramidCommandExecutor,
	#instVars : [
		'wrappee'
	],
	#category : #'NeoPyramid-command'
}

{ #category : #accessing }
PyramidCommandExecutorDecorator >> wrappee [

	^ wrappee
]

{ #category : #accessing }
PyramidCommandExecutorDecorator >> wrappee: anObject [

	wrappee := anObject
]
