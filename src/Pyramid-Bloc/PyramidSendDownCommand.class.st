Class {
	#name : #PyramidSendDownCommand,
	#superclass : #PyramidAbstractChangePositionWithSiblingsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-siblings'
}

{ #category : #'as yet unclassified' }
PyramidSendDownCommand >> setValueFor: anObject with: anArgument [
	"Check in all elements before anObject if one as the same elevation,
if true then put anObject before.
if false then find the next smallest elevation on the end and put anObject before.
"

	| elementsToSeek rightChildIndex rightChild nextElevation parent |
	parent := anObject parent.

	"Check in all elements before anObject if one as the same elevation"
	elementsToSeek := parent children asOrderedCollection allButLast:
		                  parent children size
		                  - (parent childIndexOf: anObject) + 1.
	rightChildIndex := elementsToSeek findLast: [ :each |
		                   each elevation elevation
		                   = anObject elevation elevation ].
	rightChildIndex = 0 ifFalse: [
		rightChild := parent childAt: rightChildIndex.
		parent removeChild: anObject.
		parent addChild: anObject before: rightChild.
		^ self ].

	"if false then find the next smallest elevation on the end"
	nextElevation := anObject elevation elevation.
	parent children reverseDo: [ :each |
		each elevation elevation < nextElevation ifTrue: [
			nextElevation := each elevation elevation.
			rightChild := each ] ].

	rightChild ifNil: [ ^ self ].
	anObject zIndex: nextElevation.
	parent removeChild: anObject.
	parent addChild: anObject before: rightChild
]
