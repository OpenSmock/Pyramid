Class {
	#name : #PyramidCompositeMemento,
	#superclass : #PyramidAbstractMemento,
	#instVars : [
		'mementos'
	],
	#category : #'Pyramid-history'
}

{ #category : #visiting }
PyramidCompositeMemento >> accept: aVisitor [

	^ aVisitor visitCompositeMemento: self
]

{ #category : #initialization }
PyramidCompositeMemento >> initialize [

	mementos := OrderedCollection new.
]

{ #category : #accessing }
PyramidCompositeMemento >> mementos [

	^ mementos
]

{ #category : #accessing }
PyramidCompositeMemento >> mementos: anObject [

	mementos := anObject
]

{ #category : #'window management' }
PyramidCompositeMemento >> restore [

	(self mementos allSatisfy: [ :m | m arguments isKindOf: BlElement ])
		ifFalse: [ self mementos do: [ :each | each restore ]. ^ self ].
	(self mementos asSortedCollection: [ :a :b |
			 (a arguments userData at: #removedAtIndex ifAbsent: [ 0 ])
			 < (b arguments userData at: #removedAtIndex ifAbsent: [ 0 ]) ])
		do: [ :each | each restore ]
]
