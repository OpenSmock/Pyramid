Class {
	#name : #PyCommandExecutor,
	#superclass : #PyWorkerAbstract,
	#category : #'Pyramid-test2'
}

{ #category : #'menu messages' }
PyCommandExecutor >> useCommand: aCommand onSelection: aSelection [

aSelection useCommand: aCommand
]
