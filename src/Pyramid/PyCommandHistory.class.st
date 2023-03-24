Class {
	#name : #PyCommandHistory,
	#superclass : #Object,
	#traits : 'TPyPipelineWorker',
	#classTraits : 'TPyPipelineWorker classTrait',
	#instVars : [
		'mementos',
		'historyPipeline'
	],
	#category : #'Pyramid-Plugin-History'
}

{ #category : #adding }
PyCommandHistory >> add: aMemento [

	mementos add: aMemento.
]

{ #category : #accessing }
PyCommandHistory >> historyPipeline [

	historyPipeline ifNil: [ 
		historyPipeline := PyPipeline new
			                   selection: PySelection new;
			                   addWorker: PyCommandLogger new;
			                   addWorker: PyCommandExecutor new;
			                   yourself ].
	^ historyPipeline
]

{ #category : #initialization }
PyCommandHistory >> initialize [

	mementos := OrderedCollection new.
]

{ #category : #'menu messages' }
PyCommandHistory >> undo [

	mementos ifEmpty: [ ^ self ].
	mementos removeLast restore: self historyPipeline
]

{ #category : #'menu messages' }
PyCommandHistory >> useCommand: aCommand onSelection: aSelection [

	| memento |
	memento := aSelection getCurrentMementoFor: aCommand.
	self add: memento
]
