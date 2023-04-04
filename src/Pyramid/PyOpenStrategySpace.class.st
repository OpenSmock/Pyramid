Class {
	#name : #PyOpenStrategySpace,
	#superclass : #PyEditorOpenStrategy,
	#instVars : [
		'sourceSpace'
	],
	#category : #'Pyramid-Business'
}

{ #category : #protocol }
PyOpenStrategySpace >> setupRoots: aBusiness [

	| roots |
	self sourceSpace ifNil: [
		PySpaceIsMissingError signal: 'The source space is missing.' ].
	
	roots := 	self sourceSpace root children.

	self removeParentOf: roots.

	aBusiness roots clearThenAddAll: roots
]

{ #category : #accessing }
PyOpenStrategySpace >> sourceSpace [

	^ sourceSpace
]

{ #category : #accessing }
PyOpenStrategySpace >> sourceSpace: aBlSpace [

	sourceSpace := aBlSpace
]

{ #category : #'as yet unclassified' }
PyOpenStrategySpace >> whenWindowClosed: aBusiness [
]
