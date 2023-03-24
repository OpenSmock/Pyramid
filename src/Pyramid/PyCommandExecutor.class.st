Class {
	#name : #PyCommandExecutor,
	#superclass : #Object,
	#traits : 'TPyPipelineWorker',
	#classTraits : 'TPyPipelineWorker classTrait',
	#category : #'Pyramid-Business'
}

{ #category : #'menu messages' }
PyCommandExecutor >> useCommand: aCommand onSelection: aSelection [

aSelection useCommand: aCommand
]
