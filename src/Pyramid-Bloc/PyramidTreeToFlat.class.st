Class {
	#name : #PyramidTreeToFlat,
	#superclass : #Object,
	#category : #'Pyramid-Bloc-utils'
}

{ #category : #'as yet unclassified' }
PyramidTreeToFlat class >> accumulateChildrenOf: aBlElement in: aCollection [

	aCollection add: aBlElement.
	aBlElement childrenDo: [ :each |
		self accumulateChildrenOf: each in: aCollection ]
]

{ #category : #'as yet unclassified' }
PyramidTreeToFlat class >> flattenChildrenOfCollection: aCollection [

	| ret |
	ret := OrderedCollection new.
	aCollection do: [ :each |
		self accumulateChildrenOf: each in: ret ].
	^ ret
]
