Class {
	#name : #PyCommandLogger,
	#superclass : #Object,
	#traits : 'TPyPipelineWorker',
	#classTraits : 'TPyPipelineWorker classTrait',
	#category : #'Pyramid-Plugin-Logger'
}

{ #category : #'menu messages' }
PyCommandLogger >> useCommand: aCommand onSelection: aSelection [

	Transcript crShow: aCommand printString , ' on ' , aSelection printString
]
