Class {
	#name : #PyramidObservableElementCollection,
	#superclass : #Object,
	#traits : 'TPyramidObservableElementCollection',
	#classTraits : 'TPyramidObservableElementCollection classTrait',
	#instVars : [
		'elements',
		'collection'
	],
	#category : #'NeoPyramid-models'
}

{ #category : #initialization }
PyramidObservableElementCollection >> add: anObject [

	self elements add: anObject.
	self informCollectionChanged
]

{ #category : #initialization }
PyramidObservableElementCollection >> addAll: aCollection [

	self elements addAll: aCollection.
	self informCollectionChanged
]

{ #category : #initialization }
PyramidObservableElementCollection >> elements [

	^ elements
]

{ #category : #initialization }
PyramidObservableElementCollection >> elements: aCollection [

	elements := aCollection.
	self informCollectionChanged
]

{ #category : #initialization }
PyramidObservableElementCollection >> initialize [ 
	elements := OrderedCollection new
]

{ #category : #initialization }
PyramidObservableElementCollection >> remove: anObject [

	self elements remove: anObject.
	self informCollectionChanged
]

{ #category : #initialization }
PyramidObservableElementCollection >> removeAll [

	self elements removeAll.
	self informCollectionChanged
]

{ #category : #initialization }
PyramidObservableElementCollection >> removeAll: aCollection [

	self elements removeAll: aCollection.
	self informCollectionChanged
]

{ #category : #initialization }
PyramidObservableElementCollection >> replaceAll: aCollection [

	self elements removeAll.
	self elements addAll: aCollection.
	self informCollectionChanged
]
