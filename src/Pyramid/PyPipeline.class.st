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
PyPipeline >> add: aWorker [

	workers add: aWorker
]

{ #category : #initialization }
PyPipeline >> initialize [

	workers := OrderedCollection new.
	selection := PySelection new.
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
