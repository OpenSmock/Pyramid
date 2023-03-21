Class {
	#name : #PySelection,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #'Pyramid-test2'
}

{ #category : #adding }
PySelection >> add: aBlElement [ 
	
	self elements add: aBlElement

]

{ #category : #accessing }
PySelection >> clear [

	self elements removeAll.
]

{ #category : #initialization }
PySelection >> elements [

	^ elements
]

{ #category : #'as yet unclassified' }
PySelection >> getCurrentMementoFor: aCommand [

	| memento |
	memento := PyMementoSequence new.
	self elements do: [ :each | memento add: (aCommand mementoFor: each) ].
	^ memento
]

{ #category : #initialization }
PySelection >> initialize [ 

	elements := OrderedCollection new.
]

{ #category : #accessing }
PySelection >> mementos [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
PySelection >> useCommand: aCommand [

	self elements do: [ :each | aCommand executeOn: each ]
]
