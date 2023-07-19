Class {
	#name : #PyramidCallbackCommandExecutor,
	#superclass : #PyramidCommandExecutorDecorator,
	#instVars : [
		'beforeDo',
		'afterDo'
	],
	#category : #'NeoPyramid-command'
}

{ #category : #accessing }
PyramidCallbackCommandExecutor >> afterDo [

	^ afterDo
]

{ #category : #accessing }
PyramidCallbackCommandExecutor >> afterDo: anObject [

	afterDo := anObject
]

{ #category : #accessing }
PyramidCallbackCommandExecutor >> beforeDo [

	^ beforeDo
]

{ #category : #accessing }
PyramidCallbackCommandExecutor >> beforeDo: anObject [

	beforeDo := anObject
]

{ #category : #initialization }
PyramidCallbackCommandExecutor >> initialize [

	afterDo := [  ].
	beforeDo := [  ]
]

{ #category : #'as yet unclassified' }
PyramidCallbackCommandExecutor >> use: aCommand on: aCollection with: arguments [

	self beforeDo value.
	self wrappee use: aCommand on: aCollection with: arguments.
	self afterDo value
]
