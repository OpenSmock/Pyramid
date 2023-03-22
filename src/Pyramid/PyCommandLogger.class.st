Class {
	#name : #PyCommandLogger,
	#superclass : #PyWorkerAbstract,
	#category : #'Pyramid-Business'
}

{ #category : #'menu messages' }
PyCommandLogger >> useCommand: aCommand onSelection: aSelection [

	Transcript crShow: aCommand printString , ' on ' , aSelection printString
]
