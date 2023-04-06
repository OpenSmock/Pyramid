Class {
	#name : #PyOpenStrategyElement,
	#superclass : #Object,
	#traits : 'TPyOpenStrategy',
	#classTraits : 'TPyOpenStrategy classTrait',
	#instVars : [
		'sourceElement',
		'sourceParentElement'
	],
	#category : #'Pyramid-Business-Open-Strategy'
}

{ #category : #protocol }
PyOpenStrategyElement >> open: aBusiness [

	self setupRoots: aBusiness.
	self setupWindow: aBusiness.
]

{ #category : #removing }
PyOpenStrategyElement >> removeParentOf: aCollection [

	aCollection do: [ :each | each parent removeChild: each ]
]

{ #category : #protocol }
PyOpenStrategyElement >> setupRoots: aBusiness [

	self sourceElement ifNil: [
		PyElementIsMissingError signal: 'The source element is missing.' ].

	self sourceParentElement ifNotNil: [ self sourceParentElement removeChild: self sourceElement ].

	aBusiness roots clear add: self sourceElement
]

{ #category : #accessing }
PyOpenStrategyElement >> sourceElement [

	^ sourceElement
]

{ #category : #accessing }
PyOpenStrategyElement >> sourceElement: aBlElement [

	sourceElement := aBlElement.
	sourceParentElement := aBlElement parent.
]

{ #category : #accessing }
PyOpenStrategyElement >> sourceParentElement [

	^ sourceParentElement
]

{ #category : #'as yet unclassified' }
PyOpenStrategyElement >> whenWindowClosed: aBusiness [

	self sourceElement parent ifNotNil: [
		self sourceElement parent removeChild: self sourceElement ].
	self sourceParentElement ifNotNil: [
		self sourceParentElement addChild: self sourceElement ]
]
