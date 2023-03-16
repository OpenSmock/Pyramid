Class {
	#name : #PyEventHandler,
	#superclass : #BlBasicEventHandler,
	#instVars : [
		'controller',
		'eventClass',
		'performer'
	],
	#category : #'Pyramid-Events'
}

{ #category : #'as yet unclassified' }
PyEventHandler class >> when: anEventClass send: aPerformer to: aController [

	^ self new controller: aController; performer: aPerformer; eventClass: anEventClass; yourself.
]

{ #category : #accessing }
PyEventHandler >> controller [

	^ controller
]

{ #category : #accessing }
PyEventHandler >> controller: aController [

	controller := aController
]

{ #category : #accessing }
PyEventHandler >> eventClass [

	^ eventClass
]

{ #category : #'as yet unclassified' }
PyEventHandler >> eventClass: anObject [

	eventClass := anObject
]

{ #category : #accessing }
PyEventHandler >> eventsToHandle [

	^ { self eventClass }
]

{ #category : #accessing }
PyEventHandler >> handleEvent: anEvent [

	self controller perform: self performer with: anEvent
]

{ #category : #'as yet unclassified' }
PyEventHandler >> performer [

	^ performer
]

{ #category : #accessing }
PyEventHandler >> performer: aSymbol [

	performer := aSymbol
]

{ #category : #'as yet unclassified' }
PyEventHandler >> wantsEvent: anEvent [

	^ anEvent class == self eventClass or: [ 
		  anEvent class inheritsFrom: self eventClass ]
]
