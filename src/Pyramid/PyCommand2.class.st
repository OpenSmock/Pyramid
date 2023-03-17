Class {
	#name : #PyCommand2,
	#superclass : #Object,
	#instVars : [
		'state'
	],
	#category : #'Pyramid-test'
}

{ #category : #'as yet unclassified' }
PyCommand2 class >> mementoClass [

	^ self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
PyCommand2 >> executeOn: aBlElement [

	self shouldBeImplemented
	
]

{ #category : #'as yet unclassified' }
PyCommand2 >> initialize [

	state := self newEmptyState
]

{ #category : #'as yet unclassified' }
PyCommand2 >> newEmptyState [

	^ self class mementoClass new
]

{ #category : #'as yet unclassified' }
PyCommand2 >> save: anElement on: aHistory [

	aHistory add: (self mementoFor: anElement)
]

{ #category : #accessing }
PyCommand2 >> state [

	^ state
]

{ #category : #accessing }
PyCommand2 >> state: aState [

	state := aState
]

{ #category : #'as yet unclassified' }
PyCommand2 >> stateOf: aBlElement [

	^ self class mementoClass element: aBlElement
]
