Class {
	#name : #PyPipeline,
	#superclass : #Object,
	#traits : 'TPyPipeline',
	#classTraits : 'TPyPipeline classTrait',
	#instVars : [
		'workers',
		'selection'
	],
	#category : #'Pyramid-Business'
}

{ #category : #'as yet unclassified' }
PyPipeline >> addWorkerFirst: aWorker [

	self validateWorker: aWorker.
	workers addFirst: aWorker
]

{ #category : #'as yet unclassified' }
PyPipeline >> addWorkerLast: aWorker [

	self validateWorker: aWorker.
	workers addLast: aWorker
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

	workers do: [ :each |
		each useCommand: aCommand onSelection: self selection ].
	self notifyObservers
]

{ #category : #'as yet unclassified' }
PyPipeline >> validateWorker: aWorker [

	(aWorker class usesTrait: TPyPipelineWorker) ifFalse: [
		PyNotAWorkerError signal:
			aWorker class name , ' should use ' , TPyPipelineWorker name , '.' ]
]
