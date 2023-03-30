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

{ #category : #accessing }
PyCommandHistory >> historyPipeline [

	historyPipeline ifNil: [ 
		historyPipeline := PyPipeline new
			                   selection: PySelection new;
			                   addWorkerLast: PyCommandLogger new;
			                   addWorkerLast: PyCommandExecutor new;
			                   yourself ].
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
	memento := aSelection getCurrentMementoFor: aCommand.
	self add: memento
]
