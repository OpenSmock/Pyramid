Class {
	#name : 'PyramidCommandMemento',
	#superclass : 'PyramidAbstractMemento',
	#instVars : [
		'command',
		'target',
		'arguments'
	],
	#category : 'Pyramid-history',
	#package : 'Pyramid',
	#tag : 'history'
}

{ #category : 'visiting' }
PyramidCommandMemento >> accept: aVisitor [

	^ aVisitor visitCommandMemento: self
]

{ #category : 'accessing' }
PyramidCommandMemento >> arguments [

	^ arguments
]

{ #category : 'accessing' }
PyramidCommandMemento >> arguments: anObject [

	arguments := anObject
]

{ #category : 'accessing' }
PyramidCommandMemento >> command [

	^ command
]

{ #category : 'accessing' }
PyramidCommandMemento >> command: anObject [

	command := anObject
]

{ #category : 'window management' }
PyramidCommandMemento >> restore [

	self command setValueFor: self target with: self arguments
]

{ #category : 'accessing' }
PyramidCommandMemento >> target [

	^ target
]

{ #category : 'accessing' }
PyramidCommandMemento >> target: anObject [

	target := anObject
]
