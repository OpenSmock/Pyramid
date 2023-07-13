Class {
	#name : #NeoPyramidCommandMemento,
	#superclass : #NeoPyramidAbstractMemento,
	#instVars : [
		'command',
		'target',
		'arguments'
	],
	#category : #'NeoPyramid-history'
}

{ #category : #accessing }
NeoPyramidCommandMemento >> arguments [

	^ arguments
]

{ #category : #accessing }
NeoPyramidCommandMemento >> arguments: anObject [

	arguments := anObject
]

{ #category : #accessing }
NeoPyramidCommandMemento >> command [

	^ command
]

{ #category : #accessing }
NeoPyramidCommandMemento >> command: anObject [

	command := anObject
]

{ #category : #accessing }
NeoPyramidCommandMemento >> target [

	^ target
]

{ #category : #accessing }
NeoPyramidCommandMemento >> target: anObject [

	target := anObject
]
