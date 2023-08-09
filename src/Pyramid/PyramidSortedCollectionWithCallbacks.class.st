Class {
	#name : #PyramidSortedCollectionWithCallbacks,
	#superclass : #PyramidCollectionWithCallbacks,
	#instVars : [
		'sortFunction'
	],
	#category : #'Pyramid-models'
}

{ #category : #signalling }
PyramidSortedCollectionWithCallbacks >> collection: aCollection [	

	collection := aCollection	
]

{ #category : #signalling }
PyramidSortedCollectionWithCallbacks >> signalChanged [

	self collection: (self collection sorted: self sortFunction).
	self subscriptions do: [ :callback | callback value ]
]

{ #category : #accessing }
PyramidSortedCollectionWithCallbacks >> sortFunction [

	^ sortFunction
]

{ #category : #accessing }
PyramidSortedCollectionWithCallbacks >> sortFunction: anObject [

	sortFunction := anObject
]
