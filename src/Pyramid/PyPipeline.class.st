Class {
	#name : #PyPipeline,
	#superclass : #Object,
	#instVars : [
		'workers',
		'selection'
	],
	#category : #'Pyramid-Business'
}

{ #category : #'as yet unclassified' }
PyPipeline >> addWorker: aWorker [
	self validateCorrectUsage: aWorker.
	workers add: aWorker
]

{ #category : #'as yet unclassified' }
PyPipeline >> addWorkerFirst: aWorker [

	self validateCorrectUsage: aWorker.
	workers addFirst: aWorker
]

{ #category : #'as yet unclassified' }
PyPipeline >> addWorkerLast: aWorker [

	self addWorker: aWorker
]

{ #category : #initialization }
PyPipeline >> initialize [

	workers := OrderedCollection new.
	selection := PySelection new.
]

{ #category : #'as yet unclassified' }
PyPipeline >> removeWorker: aWorker [

	workers remove: aWorker
]

{ #category : #'as yet unclassified' }
PyPipeline >> selection [

	^ selection
]

{ #category : #'as yet unclassified' }
PyPipeline >> selection: aSelection [

	selection := aSelection
]

{ #category : #adding }
PyPipeline >> useCommand: aCommand [

	workers do: [ :each | each useCommand: aCommand onSelection: self selection ].
]

{ #category : #'as yet unclassified' }
PyPipeline >> validateCorrectUsage: aWorker [

	(aWorker class usesTrait: TPyPipelineWorker) ifFalse: [
		PyNotAWorkerError signal: aWorker class name , ' should use TPyPipelineWorker.' ]
]
