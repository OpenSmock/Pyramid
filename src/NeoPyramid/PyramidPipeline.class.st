Class {
	#name : #PyramidPipeline,
	#superclass : #Object,
	#traits : 'TPyramidPipeline',
	#classTraits : 'TPyramidPipeline classTrait',
	#instVars : [
		'target',
		'workersBeforeExecute',
		'workersAfterExecute',
		'workersBeforeTerminate',
		'workersAfterTerminate',
		'workersAfterVerify',
		'workersBeforeVerify',
		'workersBeforeCancel',
		'workersAfterCancel'
	],
	#category : #'NeoPyramid-commands'
}

{ #category : #'as yet unclassified' }
PyramidPipeline >> cancel: aCommand on: anObject [

	self workersBeforeCancel do: [ :each |
		each useCommand: aCommand on: anObject ].

	anObject cancel: aCommand.
	self informPipelineCancelCommand.

	self workersAfterCancel do: [ :each |
		each useCommand: aCommand on: anObject ]
]

{ #category : #'as yet unclassified' }
PyramidPipeline >> execute: aCommand on: anObject [

	self workersBeforeExecute do: [ :each |
		each useCommand: aCommand on: anObject ].

	anObject execute: aCommand.
	self informPipelineExecuteCommand.

	self workersAfterExecute do: [ :each |
		each useCommand: aCommand on: anObject ]
]

{ #category : #'as yet unclassified' }
PyramidPipeline >> terminate: aCommand on: anObject [

	self workersBeforeTerminate do: [ :each |
		each useCommand: aCommand on: anObject ].

	anObject terminate: aCommand.
	self informPipelineTerminateCommand.

	self workersAfterTerminate do: [ :each |
		each useCommand: aCommand on: anObject ]
]

{ #category : #adding }
PyramidPipeline >> useCommand: aCommand on: anObject [

	| isCommandOk |
	isCommandOk := self verify: aCommand on: anObject.
	isCommandOk
		ifTrue: [ self execute: aCommand on: anObject ]
		ifFalse: [ self cancel: aCommand on: anObject ].
	self terminate: aCommand on: anObject
]

{ #category : #'as yet unclassified' }
PyramidPipeline >> verify: aCommand on: anObject [

	| isCommanOk |
	self workersBeforeVerify do: [ :each |
		each useCommand: aCommand on: anObject ].

	isCommanOk := anObject verify: aCommand.
	self informPipelineVerifyCommand.

	self workersAfterVerify do: [ :each |
		each useCommand: aCommand on: anObject ].

	^ isCommanOk
]

{ #category : #accessing }
PyramidPipeline >> workersAfterCancel [

	workersAfterCancel ifNil: [
		workersAfterCancel := OrderedCollection new ].
	^ workersAfterCancel
]

{ #category : #accessing }
PyramidPipeline >> workersAfterExecute [

	workersAfterExecute ifNil: [
		workersAfterExecute := OrderedCollection new ].
	^ workersAfterExecute
]

{ #category : #accessing }
PyramidPipeline >> workersAfterTerminate [

	workersAfterTerminate ifNil: [
		workersAfterTerminate := OrderedCollection new ].
	^ workersAfterTerminate
]

{ #category : #accessing }
PyramidPipeline >> workersAfterVerify [

	workersAfterVerify ifNil: [
		workersAfterVerify := OrderedCollection new ].
	^ workersAfterVerify
]

{ #category : #accessing }
PyramidPipeline >> workersBeforeCancel [

	workersBeforeCancel ifNil: [
		workersBeforeCancel := OrderedCollection new ].
	^ workersBeforeCancel
]

{ #category : #accessing }
PyramidPipeline >> workersBeforeExecute [

	workersBeforeExecute ifNil: [ workersBeforeExecute := OrderedCollection new ].
	^ workersBeforeExecute
]

{ #category : #accessing }
PyramidPipeline >> workersBeforeTerminate [

	workersBeforeTerminate ifNil: [
		workersBeforeTerminate := OrderedCollection new ].
	^ workersBeforeTerminate
]

{ #category : #accessing }
PyramidPipeline >> workersBeforeVerify [

	workersBeforeVerify ifNil: [
		workersBeforeVerify := OrderedCollection new ].
	^ workersBeforeVerify
]
