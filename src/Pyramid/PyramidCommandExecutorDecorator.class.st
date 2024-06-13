"
I‘m a decorator for the `PyramidMainCommandExecutor`. The wrappe is either the `PyramidMainCommandExecutor` or another decorator.

"
Class {
	#name : 'PyramidCommandExecutorDecorator',
	#superclass : 'PyramidCommandExecutor',
	#instVars : [
		'wrappee'
	],
	#category : 'Pyramid-commands',
	#package : 'Pyramid',
	#tag : 'commands'
}

{ #category : 'testing' }
PyramidCommandExecutorDecorator class >> isAbstract [

	^ self == PyramidCommandExecutorDecorator
]

{ #category : 'accessing' }
PyramidCommandExecutorDecorator >> wrappee [

	^ wrappee
]

{ #category : 'accessing' }
PyramidCommandExecutorDecorator >> wrappee: anObject [

	wrappee := anObject
]
