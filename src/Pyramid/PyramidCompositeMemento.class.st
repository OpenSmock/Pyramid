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

	| isRemove |
	(self mementos allSatisfy: [ :m | m arguments isKindOf: BlElement ])
		ifFalse: [
				self mementos do: [ :each | each restore ].
				^ self ].

	isRemove := self mementos first command isKindOf:
		            PyramidRemoveChildCommand.
	isRemove
		ifTrue: [ 
				self mementos do: [ :each |
					each command saveIndexOf: each arguments ].
				(self mementos asSortedCollection: [ :a :b |
						 (a arguments userData
							  at: #pyramidRemovedAtIndex
							  ifAbsent: [ 0 ])
						 >
						 (b arguments userData
							  at: #pyramidRemovedAtIndex
							  ifAbsent: [ 0 ]) ]) do: [ :each |
					each target removeChild: each arguments ] ]
		ifFalse: [
				(self mementos asSortedCollection: [ :a :b |
						 (a arguments userData
							  at: #pyramidRemovedAtIndex
							  ifAbsent: [ 0 ])
						 <
						 (b arguments userData
							  at: #pyramidRemovedAtIndex
							  ifAbsent: [ 0 ]) ]) do: [ :each | each restore ] ]
]
