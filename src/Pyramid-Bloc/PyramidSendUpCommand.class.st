Class {
	#name : #PyramidSendUpCommand,
	#superclass : #PyramidAbstractChangePositionWithSiblingsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-siblings'
}

{ #category : #'as yet unclassified' }
PyramidSendUpCommand >> setValueFor: anObject with: anArgument [

	| leftChild nextElevation parent |
	parent := anObject parent.
	leftChild := parent childAt:
		             (parent children asOrderedCollection findLast: [ :each |
			              each elevation elevation
			              = anObject elevation elevation ]).
	leftChild = anObject ifFalse: [
		parent removeChild: anObject.
		parent addChild: anObject after: leftChild.
		^ self ].
	nextElevation := anObject elevation elevation.
	parent children do: [ :each |
		each elevation elevation > nextElevation ifTrue: [
			nextElevation := each elevation elevation.
			leftChild := each ] ].
	leftChild ifNil: [ ^ self ].
	anObject zIndex: nextElevation.
	parent removeChild: anObject.
	parent addChild: anObject after: leftChild
]
