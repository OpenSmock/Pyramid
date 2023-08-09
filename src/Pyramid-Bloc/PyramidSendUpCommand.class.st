Class {
	#name : #PyramidSendUpCommand,
	#superclass : #PyramidAbstractChangePositionWithSiblingsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-siblings'
}

{ #category : #'as yet unclassified' }
PyramidSendUpCommand >> setValueFor: anObject with: anArgument [
	"Check in all elements after anObject if one as the same elevation,
if true then put anObject after.
if false then find the next highest elevation on the start and put anObject after.
"

	| elementsToSeek leftChildIndex leftChild nextElevation parent |
	parent := anObject parent.

	"Check in all elements after anObject if one as the same elevation"
	elementsToSeek := parent children asOrderedCollection allButFirst:
		                  (parent childIndexOf: anObject).
	leftChildIndex := elementsToSeek findFirst: [ :each |
		                  each elevation elevation
		                  = anObject elevation elevation ].
	leftChildIndex = 0 ifFalse: [
		leftChild := parent childAt: leftChildIndex + (parent childIndexOf: anObject).
		parent removeChild: anObject.
		parent addChild: anObject after: leftChild.
		^ self ].

	"if false then find the next highest elevation on the start"
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
