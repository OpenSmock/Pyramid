Class {
	#name : #PyramidSendDownCommand,
	#superclass : #PyramidAbstractChangePositionWithSiblingsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-siblings'
}

{ #category : #'as yet unclassified' }
PyramidSendDownCommand >> setValueFor: anObject with: anArgument [

	| rightChild nextElevation parent |
	parent := anObject parent.
	rightChild := parent childAt:
		              (parent children asOrderedCollection findFirst: [
			               :each |
			               each elevation elevation
			               = anObject elevation elevation ]).
	rightChild = anObject ifFalse: [
		parent removeChild: anObject.
		parent addChild: anObject before: rightChild.
		^ self ].
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
