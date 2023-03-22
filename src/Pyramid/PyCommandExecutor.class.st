Class {
	#name : #PyCommandExecutor,
	#superclass : #PyWorkerAbstract,
	#category : #'Pyramid-Business'
}

{ #category : #'menu messages' }
PyCommandExecutor >> useCommand: aCommand onSelection: aSelection [

aSelection useCommand: aCommand
]
