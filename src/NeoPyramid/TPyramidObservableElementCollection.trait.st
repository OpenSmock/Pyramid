Trait {
	#name : #TPyramidObservableElementCollection,
	#instVars : [
		'observers'
	],
	#category : #'NeoPyramid-models'
}

{ #category : #adding }
TPyramidObservableElementCollection >> addObserver: anObserver [
	self observers add: anObserver
]

{ #category : #'as yet unclassified' }
TPyramidObservableElementCollection >> informCollectionChanged [
	self observers do: [ :each | each pyramidCollectionChanged ]
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
