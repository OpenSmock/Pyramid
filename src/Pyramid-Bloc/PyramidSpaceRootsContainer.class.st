Class {
	#name : #PyramidSpaceRootsContainer,
	#superclass : #PyramidSpaceContainer,
	#traits : 'TPyramidProjectModelObserver',
	#classTraits : 'TPyramidProjectModelObserver classTrait',
	#instVars : [
		'projectModel'
	],
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #accessing }
PyramidSpaceRootsContainer >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidSpaceRootsContainer >> projectModel: anObject [

	projectModel := anObject.
	projectModel addObserver: self.
	self pyramidRootsChanged
]

{ #category : #'as yet unclassified' }
PyramidSpaceRootsContainer >> pyramidRootsChanged [

	self element removeChildren.
	self projectModel roots do: [ :each |
		each parent ifNotNil: [ :p | p removeChild: each ] ].
	self element addChildren: self projectModel roots
]
