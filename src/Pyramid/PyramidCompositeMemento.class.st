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

	self mementos do: [ :each | each restore ]
]
