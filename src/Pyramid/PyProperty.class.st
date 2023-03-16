Class {
	#name : #PyProperty,
	#superclass : #Object,
	#instVars : [
		'commandClass',
		'modelClass',
		'mementoClass'
	],
	#category : #'Pyramid-test2'
}

{ #category : #'as yet unclassified' }
PyProperty class >> commandClass: aClass1 modelClass: aClass2 mementoClass: aClass3 [

	^ self new commandClass: aClass1; modelClass: aClass2; mementoClass: aClass3; yourself
]

{ #category : #accessing }
PyProperty >> commandClass [

	^ commandClass
]

{ #category : #accessing }
PyProperty >> commandClass: anObject [

	commandClass := anObject
]

{ #category : #accessing }
PyProperty >> mementoClass [

	^ mementoClass
]

{ #category : #accessing }
PyProperty >> mementoClass: anObject [

	mementoClass := anObject
]

{ #category : #accessing }
PyProperty >> modelClass [

	^ modelClass
]

{ #category : #accessing }
PyProperty >> modelClass: anObject [

	modelClass := anObject
]
