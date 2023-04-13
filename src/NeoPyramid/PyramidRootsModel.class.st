Class {
	#name : #PyramidRootsModel,
	#superclass : #Object,
	#traits : 'TPyramidObservableElementCollectionObserver',
	#classTraits : 'TPyramidObservableElementCollectionObserver classTrait',
	#instVars : [
		'collection',
		'project'
	],
	#category : #'NeoPyramid-models'
}

{ #category : #accessing }
PyramidRootsModel >> collection [
	^ collection
]

{ #category : #initialization }
PyramidRootsModel >> initialize [

	collection := PyramidObservableElementCollection new.
	collection addObserver: self
]

{ #category : #accessing }
PyramidRootsModel >> project [

	^ project
]

{ #category : #accessing }
PyramidRootsModel >> project: aPyramidProjectModel [
	project := aPyramidProjectModel
]

{ #category : #'as yet unclassified' }
PyramidRootsModel >> pyramidCollectionChanged [

	self project rootsChanged
]
