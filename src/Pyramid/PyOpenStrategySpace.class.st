Class {
	#name : #PyOpenStrategySpace,
	#superclass : #Object,
	#traits : 'TPyOpenStrategy',
	#classTraits : 'TPyOpenStrategy classTrait',
	#instVars : [
		'sourceSpace',
		'oldRootBackground'
	],
	#category : #'Pyramid-Business-Open-Strategy'
}

{ #category : #accessing }
PyOpenStrategySpace >> oldRootBackground [

	^ oldRootBackground
]

{ #category : #accessing }
PyOpenStrategySpace >> oldRootBackground: anObject [

	oldRootBackground := anObject
]

{ #category : #removing }
PyOpenStrategySpace >> removeParentOf: aCollection [

	aCollection do: [ :each | each parent removeChild: each ]
]

{ #category : #protocol }
PyOpenStrategySpace >> setupRoots: aBusiness [

	| roots |
	self sourceSpace ifNil: [
		PySpaceIsMissingError signal: 'The source space is missing.' ].

	self oldRootBackground: self sourceSpace root background.
	self sourceSpace root background:
		(BlImageBackground new image: self sourceSpace root aeAsForm).

	roots := self sourceSpace root children collect: [ :each | each ].

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

	self sourceSpace root background: self oldRootBackground.
	self removeParentOf: aBusiness roots elements.
	self sourceSpace root addChildren: aBusiness roots elements.
]
