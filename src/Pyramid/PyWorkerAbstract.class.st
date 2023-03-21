Class {
	#name : #PyWorkerAbstract,
	#superclass : #Object,
	#category : #'Pyramid-test2'
}

{ #category : #testing }
PyWorkerAbstract class >> isAbstract [

	^ self == PyWorkerAbstract
]

{ #category : #'as yet unclassified' }
PyWorkerAbstract >> useCommand: aCommand onSelection: aSelection [
	
	self shouldBeImplemented
]
