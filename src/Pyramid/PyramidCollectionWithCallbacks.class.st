Class {
	#name : #PyramidCollectionWithCallbacks,
	#superclass : #SequenceableCollection,
	#instVars : [
		'collection',
		'subscriptions'
	],
	#category : #'Pyramid-models'
}

{ #category : #adding }
PyramidCollectionWithCallbacks >> add: newObject [

	| result |
	result := self collection add: newObject.
	self signalChanged.
	^ result
]

{ #category : #adding }
PyramidCollectionWithCallbacks >> addAll: newObjects [

	| result |
	newObjects ifEmpty: [ ^ newObjects ].
	result := self collection addAll: newObjects.
	self signalChanged.
	^ result
]

{ #category : #accessing }
PyramidCollectionWithCallbacks >> at: anInteger [

	^ self collection at: anInteger
]

{ #category : #accessing }
PyramidCollectionWithCallbacks >> collection [

	^ collection
]

{ #category : #enumerating }
PyramidCollectionWithCallbacks >> do: aBlock [

	^ self collection do: aBlock
]

{ #category : #initialization }
PyramidCollectionWithCallbacks >> initialize [

	collection := OrderedCollection new.
	subscriptions := Dictionary new
]

{ #category : #removing }
PyramidCollectionWithCallbacks >> remove: oldObject [

	| result |
	result := self collection remove: oldObject.
	self signalChanged.
	^ result
]

{ #category : #removing }
PyramidCollectionWithCallbacks >> remove: oldObject ifAbsent: anExceptionBlock [

	| result |
	(self collection includes: oldObject) ifFalse: [
		^ anExceptionBlock value ].
	result := self collection remove: oldObject.
	self signalChanged.
	^ result
]

{ #category : #removing }
PyramidCollectionWithCallbacks >> removeAll [

	| result |
	self collection ifEmpty: [ ^ {  } ].
	result := self collection removeAll.
	self signalChanged.
	^ result
]

{ #category : #removing }
PyramidCollectionWithCallbacks >> removeAll: oldObjects [

	| result |
	self collection ifEmpty: [ ^ {  } ].
	result := self collection removeAll: oldObjects.
	self signalChanged.
	^ result
]

{ #category : #removing }
PyramidCollectionWithCallbacks >> replaceAll: newObjects [

	| result |
	(self collection isEmpty and: newObjects isEmpty) ifTrue: [
		^ newObjects ].
	self collection removeAll.
	result := self collection addAll: newObjects.
	self signalChanged.
	^ result
]

{ #category : #signalling }
PyramidCollectionWithCallbacks >> signalChanged [

	self subscriptions do: [ :callback | callback value ]
]

{ #category : #accessing }
PyramidCollectionWithCallbacks >> size [ 

^ self collection size
]

{ #category : #'as yet unclassified' }
PyramidCollectionWithCallbacks >> subscribe: anObject withCallback: aBlock [

	self subscriptions at: anObject ifPresent: [ Error signal: 'Already subscribed.' ] ifAbsentPut: [ aBlock ]
	
]

{ #category : #accessing }
PyramidCollectionWithCallbacks >> subscriptions [
^ subscriptions
]

{ #category : #'as yet unclassified' }
PyramidCollectionWithCallbacks >> unsubscribe: anObject [

	self subscriptions
		remove: anObject
]
