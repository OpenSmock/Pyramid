Class {
	#name : #PyPropertyPlugin,
	#superclass : #Object,
	#instVars : [
		'commandClass',
		'mementoClass'
	],
	#category : #'Pyramid-Business'
}

{ #category : #'as yet unclassified' }
PyPropertyPlugin class >> commandClass: aClass1 modelClass: aClass2 mementoClass: aClass3 [

	^ self new commandClass: aClass1; modelClass: aClass2; mementoClass: aClass3; yourself
]

{ #category : #accessing }
PyPropertyPlugin >> commandClass [

	^ commandClass
]

{ #category : #accessing }
PyPropertyPlugin >> commandClass: anObject [

	commandClass := anObject
]

{ #category : #actions }
PyPropertyPlugin >> install [

	commandClass mementoClass: self mementoClass
]

{ #category : #accessing }
PyPropertyPlugin >> mementoClass [

	^ mementoClass
]

{ #category : #accessing }
PyPropertyPlugin >> mementoClass: anObject [

	mementoClass := anObject
]
