Class {
	#name : #PyCommandHistory,
	#superclass : #Object,
	#traits : 'TPyPipelineWorker + TPyHistory',
	#classTraits : 'TPyPipelineWorker classTrait + TPyHistory classTrait',
	#instVars : [
		'mementos',
		'historyPipeline'
	],
	#category : #'Pyramid-Plugin-History'
}

{ #category : #adding }
PyCommandHistory >> add: aMemento [

	self mementos add: aMemento.
	self notifyObservers
]

{ #category : #'as yet unclassified' }
PyCommandHistory >> getCurrentMementoFor: aCommand on: aSelection [

	| memento |
	memento := PyMementoSequence new.
	aSelection elements do: [ :each | memento add: (aCommand mementoFor: each) ].
	^ memento
]

{ #category : #accessing }
PyCommandHistory >> historyPipeline [

	historyPipeline ifNil: [ historyPipeline := PyPipeline new selection: PySelection new; yourself ].
	^ historyPipeline
]

{ #category : #initialization }
PyCommandHistory >> initialize [

	mementos := OrderedCollection new.
]

{ #category : #accessing }
PyCommandHistory >> mementos [

	^ mementos
]

{ #category : #'menu messages' }
PyCommandHistory >> undo [

	self mementos ifEmpty: [ ^ self ].
	self mementos removeLast restore: self historyPipeline.
	self notifyObservers
]

{ #category : #'menu messages' }
PyCommandHistory >> useCommand: aCommand onSelection: aSelection [

	| memento |
	memento := self getCurrentMementoFor: aCommand on: aSelection.
	self add: memento
]
