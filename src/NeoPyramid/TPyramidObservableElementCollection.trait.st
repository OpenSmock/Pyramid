Trait {
	#name : #TPyramidObservableElementCollection,
	#instVars : [
		'observers',
		'isLock'
	],
	#category : #'NeoPyramid-models'
}

{ #category : #adding }
TPyramidObservableElementCollection >> addObserver: anObserver [
	self observers add: anObserver
]

{ #category : #'as yet unclassified' }
TPyramidObservableElementCollection >> informCollectionChanged [

	self isLock ifFalse: [ 
	self observers do: [ :each | each pyramidCollectionChanged ] ]
]

{ #category : #accessing }
TPyramidObservableElementCollection >> isLock [

	^ isLock
]

{ #category : #accessing }
TPyramidObservableElementCollection >> lock [

	isLock := true
]

{ #category : #adding }
TPyramidObservableElementCollection >> observers [

	observers ifNil: [ observers := Set new ].
	^ observers
]

{ #category : #adding }
TPyramidObservableElementCollection >> removeObserver: anObserver [

	self observers remove: anObserver
]

{ #category : #accessing }
TPyramidObservableElementCollection >> unlock [

	isLock := false
]
