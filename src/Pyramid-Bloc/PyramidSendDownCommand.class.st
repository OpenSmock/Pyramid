Class {
	#name : #PyramidSendDownCommand,
	#superclass : #PyramidAbstractChangePositionWithSiblingsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-siblings'
}

{ #category : #'as yet unclassified' }
PyramidSendDownCommand >> setValueFor: anObject with: anArgument [

	| rightChild nextElevation |
	rightChild := anObject parent children findFirst: [ :each |
		              each elevation elevation
		              = anObject elevation elevation ].
	rightChild = anObject ifFalse: [
		anObject parent removeChild: anObject.
		anObject parent addChild: anObject before: rightChild.
		^ self ].
	nextElevation := anObject elevation elevation.
	anObject parent children reverseDo: [ :each |
		each elevation elevation < nextElevation ifTrue: [
			nextElevation := each elevation elevation.
			rightChild := each ] ].
	rightChild ifNil: [ ^ self ].
	anObject zIndex: nextElevation.
	anObject parent removeChild: anObject.
	anObject parent addChild: anObject after: rightChild
]
