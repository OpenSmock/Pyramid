Class {
	#name : 'PyramidElementsManipulationHelper',
	#superclass : 'Object',
	#category : 'Pyramid-Bloc-utils',
	#package : 'Pyramid-Bloc',
	#tag : 'utils'
}

{ #category : 'as yet unclassified' }
PyramidElementsManipulationHelper class >> accumulateChildrenOf: aBlElement in: aCollection [

	aCollection add: aBlElement.
	(aBlElement children asArray sorted: PyramidElevationSortFunction new)
	do: [ :each |
		self accumulateChildrenOf: each in: aCollection ]
]

{ #category : 'as yet unclassified' }
PyramidElementsManipulationHelper class >> accumulateParentsOf: aCollectionOfBlElement in: result [

	| elementToTest onCollection nextCollection shouldKeepIt |
	shouldKeepIt := true.
	aCollectionOfBlElement isEmpty ifTrue: [ ^ self ].
	aCollectionOfBlElement size = 1 ifTrue: [
		result add: aCollectionOfBlElement first.
		^ self ].

	elementToTest := aCollectionOfBlElement first.
	onCollection := aCollectionOfBlElement allButFirst.
	nextCollection := OrderedCollection new.

	onCollection do: [ :each |
		(each hasParent: elementToTest) ifFalse: [
			nextCollection add: each ].
		(shouldKeepIt and: [ elementToTest hasParent: each ]) ifTrue: [
			shouldKeepIt := false ] ].
	shouldKeepIt ifTrue: [ result add: elementToTest ].
	self accumulateParentsOf: nextCollection in: result
]

{ #category : 'as yet unclassified' }
PyramidElementsManipulationHelper class >> flattenChildrenOfCollection: aCollection [
	"Consider:
A1->A2-A3.
B1->B2->B3.

col := { A1 . B2 }

PyramidElementsManipulationHelper flattenChildrenOfCollection: col
returns
{ A1 . A2 . A3 . B2 . B3 }
"

	| ret |
	ret := OrderedCollection new.
	(aCollection asArray sorted: PyramidElevationSortFunction new) do: [ :each |
		self accumulateChildrenOf: each in: ret ].
	^ ret
]

{ #category : 'as yet unclassified' }
PyramidElementsManipulationHelper class >> onlyParents: aCollectionOfBlElement [
	"return a collection whithout any parent-child relation.
	Example:
	consider this as all elements
	A1->A2->A3
	B1->B2->B3.
	C1->C2->C3.
	D1->D2->D3.
	
	selection := {A1 . B1 . B2 . C1 . C3}.
	PyramidElementsManipulationHelper onlyParents: selection
	returns: { A1 . B1 . C1 }
	"

	| result |
	aCollectionOfBlElement isEmpty ifTrue: [ ^ {  } ].
	aCollectionOfBlElement size = 1 ifTrue: [
		^ { aCollectionOfBlElement first } ].
	result := OrderedCollection new.
	self accumulateParentsOf: aCollectionOfBlElement in: result.
	^ result asArray
]
