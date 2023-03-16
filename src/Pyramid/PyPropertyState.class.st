Class {
	#name : #PyPropertyState,
	#superclass : #Object,
	#instVars : [
		'element'
	],
	#category : #'Pyramid-test'
}

{ #category : #'instance creation' }
PyPropertyState class >> element: aBlElement [

	^ self new
		  stateFrom: aBlElement;
		  element: aBlElement;
		  yourself
]

{ #category : #'window management' }
PyPropertyState >> restore [

	self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
PyPropertyState >> stateFrom: aBlElement [

	
]
