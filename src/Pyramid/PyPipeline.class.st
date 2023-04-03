Class {
	#name : #PyPipeline,
	#superclass : #Object,
	#traits : 'TPyPipeline',
	#classTraits : 'TPyPipeline classTrait',
	#instVars : [
		'selection',
		'workersBeforeExecute',
		'workersAfterExecute',
		'workersBeforeTerminate',
		'workersAfterTerminate',
		'workersAfterVerify',
		'workersBeforeVerify',
		'workersBeforeCancel',
		'workersAfterCancel'
	],
	#category : #'Pyramid-Business-Pipeline'
}

{ #category : #adding }
PyPipeline >> addWorkerBeforeExecute: aWorker [

	self validateWorker: aWorker.
	self workersBeforeExecute add: aWorker
]

{ #category : #adding }
PyPipeline >> addWorkersBeforeTerminate: aWorker [

	self validateWorker: aWorker.
	self workersBeforeTerminate add: aWorker
]

{ #category : #'editing keys' }
PyPipeline >> cancel: aCommand [
	"Do nothing ..."
]

{ #category : #'as yet unclassified' }
PyPipeline >> commandCancel: aCommand [

	self workersBeforeCancel do: [ :each |
		each useCommand: aCommand onSelection: self selection ].

	self cancel: aCommand.
	self notifyObserversPipelineCancelCommand.

	self workersAfterCancel do: [ :each |
		each useCommand: aCommand onSelection: self selection ]
]

{ #category : #'as yet unclassified' }
PyPipeline >> commandExecute: aCommand [

	self workersBeforeExecute do: [ :each |
		each useCommand: aCommand onSelection: self selection ].

	self execute: aCommand.
	self notifyObserversPipelineExecuteCommand.

	self workersAfterExecute do: [ :each |
		each useCommand: aCommand onSelection: self selection ]
]

{ #category : #'as yet unclassified' }
PyPipeline >> commandTerminate: aCommand [

	self workersBeforeTerminate do: [ :each |
		each useCommand: aCommand onSelection: self selection ].

	self terminate: aCommand.
	self notifyObserversPipelineTerminateCommand.

	self workersAfterTerminate do: [ :each |
		each useCommand: aCommand onSelection: self selection ]
]

{ #category : #'as yet unclassified' }
PyPipeline >> commandVerify: aCommand [

	| isCommanOk setCommandFalse |
	isCommanOk := true.
	setCommandFalse := [ isCommanOk := false ].

	self workersBeforeVerify do: [ :each |
		each useCommand: aCommand onSelection: PySelectionVoid new ].

	[
	[
	[
	[
	[ self verify: aCommand ]
		on: PyNotACommandError
		do: setCommandFalse ]
		on: PyArgumentShouldNotBeNilError
		do: setCommandFalse ]
		on: PySelectionIsNilError
		do: setCommandFalse ]
		on: PySelectionIsEmptyException
		do: setCommandFalse ]
		on: PyCommandBringsNoChangeException
		do: setCommandFalse.
	self notifyObserversPipelineVerifyCommand.

	self workersAfterVerify do: [ :each |
		each useCommand: aCommand onSelection: self selection ].

	^ isCommanOk
]

{ #category : #execution }
PyPipeline >> execute: aCommand [

	self selection useCommand: aCommand
]

{ #category : #initialization }
PyPipeline >> initialize [

	selection := PySelectionVoid new
]

{ #category : #'as yet unclassified' }
PyPipeline >> selection [

	^ selection
]

{ #category : #'as yet unclassified' }
PyPipeline >> selection: aSelection [

	selection := aSelection
]

{ #category : #execution }
PyPipeline >> terminate: aCommand [

	self selection: PySelectionVoid new.
]

{ #category : #adding }
PyPipeline >> useCommand: aCommand [

	| isCommandOk |
	isCommandOk := self commandVerify: aCommand.
	isCommandOk
		ifTrue: [ self commandExecute: aCommand ]
		ifFalse: [ self commandCancel: aCommand ].
	self commandTerminate: aCommand.
]

{ #category : #'as yet unclassified' }
PyPipeline >> validateWorker: aWorker [

	(aWorker class usesTrait: TPyPipelineWorker) ifFalse: [
		PyNotAWorkerError signal:
			aWorker class name , ' should use ' , TPyPipelineWorker name , '.' ]
]

{ #category : #'as yet unclassified' }
PyPipeline >> verify: aCommand [

	(aCommand class inheritsFrom: PyCommand) ifFalse: [
		PyNotACommandError signal:
			aCommand class name , ' should inherit ' , PyCommand name , '.' ].

	aCommand arguments ifNil: [
		PyArgumentShouldNotBeNilError signal:
			'The arguments of the command is nil.' ].

	self selection isVoid ifTrue: [
		PySelectionIsNilError signal:
			'Could not execute the command <' , PyCommand name
			, '> on empty selection.' ].
	
	self verifyCommandIsDoingSomething: aCommand
]

{ #category : #'as yet unclassified' }
PyPipeline >> verifyCommandIsDoingSomething: aCommand [

	| states |
	self selection ifEmpty: [
		PySelectionIsEmptyException signal:
			'The selection is empty for <' , aCommand printString , '>.' ].
	

	states := (self selection getStatesFor: aCommand) asSet asArray.
	(states size == 1 and: [ aCommand arguments value = states first ]) ifTrue: [ PyCommandBringsNoChangeException signal: 'The command <' , aCommand printString , '> do not change the state of the element.' ]

	
]

{ #category : #accessing }
PyPipeline >> workersAfterCancel [

	workersAfterCancel ifNil: [
		workersAfterCancel := OrderedCollection new ].
	^ workersAfterCancel
]

{ #category : #accessing }
PyPipeline >> workersAfterExecute [

	workersAfterExecute ifNil: [
		workersAfterExecute := OrderedCollection new ].
	^ workersAfterExecute
]

{ #category : #accessing }
PyPipeline >> workersAfterTerminate [

	workersAfterTerminate ifNil: [
		workersAfterTerminate := OrderedCollection new ].
	^ workersAfterTerminate
]

{ #category : #accessing }
PyPipeline >> workersAfterVerify [

	workersAfterVerify ifNil: [
		workersAfterVerify := OrderedCollection new ].
	^ workersAfterVerify
]

{ #category : #accessing }
PyPipeline >> workersBeforeCancel [

	workersBeforeCancel ifNil: [
		workersBeforeCancel := OrderedCollection new ].
	^ workersBeforeCancel
]

{ #category : #accessing }
PyPipeline >> workersBeforeExecute [

	workersBeforeExecute ifNil: [ workersBeforeExecute := OrderedCollection new ].
	^ workersBeforeExecute
]

{ #category : #accessing }
PyPipeline >> workersBeforeTerminate [

	workersBeforeTerminate ifNil: [
		workersBeforeTerminate := OrderedCollection new ].
	^ workersBeforeTerminate
]

{ #category : #accessing }
PyPipeline >> workersBeforeVerify [

	workersBeforeVerify ifNil: [
		workersBeforeVerify := OrderedCollection new ].
	^ workersBeforeVerify
]
