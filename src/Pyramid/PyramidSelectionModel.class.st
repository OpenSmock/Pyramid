Class {
	#name : #PyramidSelectionModel,
	#superclass : #Object,
	#traits : 'TPyramidObservableElementCollectionObserver',
	#classTraits : 'TPyramidObservableElementCollectionObserver classTrait',
	#instVars : [
		'collection',
		'project'
	],
	#category : #'Pyramid-models'
}

{ #category : #accessing }
PyramidSelectionModel >> collection [

	^ collection
]

{ #category : #initialization }
PyramidSelectionModel >> initialize [ 
	collection := PyramidObservableElementCollection new.
	collection addObserver: self
]

{ #category : #accessing }
PyramidSelectionModel >> project [

	^ project
]

{ #category : #accessing }
PyramidSelectionModel >> project: aPyramidProjectModel [

	project := aPyramidProjectModel
]

{ #category : #'as yet unclassified' }
PyramidSelectionModel >> pyramidCollectionChanged [

	self project selectionChanged
]
