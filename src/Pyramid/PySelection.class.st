Class {
	#name : #PySelection,
	#superclass : #Object,
	#traits : 'TPySelection',
	#classTraits : 'TPySelection classTrait',
	#instVars : [
		'elements',
		'lock'
	],
	#category : #'Pyramid-Business'
}

{ #category : #adding }
PySelection >> add: aBlElement [

	self elements add: aBlElement.
	self notifyObservers
]

{ #category : #adding }
PySelection >> addAll: aCollection [

	self elements addAll: aCollection.
	self notifyObservers
]

{ #category : #accessing }
PySelection >> clear [

	self elements removeAll.
	self notifyObservers
]

{ #category : #adding }
PySelection >> clearThenAddAll: aCollection [

	self isLocked ifFalse: [ self elements removeAll.
	self elements addAll: aCollection.
	self notifyObservers ]
	
]

{ #category : #initialization }
PySelection >> elements [

	^ elements
]

{ #category : #'as yet unclassified' }
PySelection >> getStatesFor: aCommand [

	^ (self elements collect: [ :each |
		  | state |
		  state := PyCommandArguments new.
		  aCommand stateOf: each for: state.
		  state value ]) asSet asArray
]

{ #category : #testing }
PySelection >> ifEmpty: aFullBlockClosure [ 
	self elements ifEmpty: aFullBlockClosure
]

{ #category : #initialization }
PySelection >> initialize [

	elements := OrderedCollection new.
	lock := false
]

{ #category : #testing }
PySelection >> isEmpty [

	^ self elements isEmpty 
]

{ #category : #testing }
PySelection >> isLocked [
	^ lock
]

{ #category : #accessing }
PySelection >> lock [
	lock := true
]

{ #category : #printing }
PySelection >> printOn: aStream [

	super printOn: aStream.
	aStream nextPut: $(.
	self size printOn: aStream.
	aStream nextPut: $)

]

{ #category : #accessing }
PySelection >> selectChildren [

	| final |
	final := Set new.
	self elements do: [ :each |
		final add: each.
		final addAll: (each allChildrenBreadthFirstSelect: [ :e | true ]) ].
	self clearThenAddAll: final asOrderedCollection
]

{ #category : #accessing }
PySelection >> size [
	^ self elements size
]

{ #category : #accessing }
PySelection >> unlock [

	lock := false
]

{ #category : #'as yet unclassified' }
PySelection >> useCommand: aCommand [

	self elements do: [ :each | aCommand executeOn: each ]
]
