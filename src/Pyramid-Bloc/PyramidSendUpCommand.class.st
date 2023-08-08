Class {
	#name : #PyramidSendUpCommand,
	#superclass : #PyramidAbstractChangePositionWithSiblingsCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-siblings'
}

{ #category : #'as yet unclassified' }
PyramidSendUpCommand >> setValueFor: anObject with: anArgument [

	| leftChild nextElevation |
	leftChild := anObject parent children findLast: [ :each |
		             each elevation elevation = anObject elevation elevation ].
	leftChild = anObject ifFalse: [
		anObject parent removeChild: anObject.
		anObject parent addChild: anObject after: leftChild.
		^ self ].
	nextElevation := anObject elevation elevation.
	anObject parent children reverseDo: [ :each |
		each elevation elevation > nextElevation ifTrue: [
			nextElevation := each elevation elevation.
			leftChild := each ] ].
	leftChild ifNil: [ ^ self ].
	anObject zIndex: nextElevation.
	anObject parent removeChild: anObject.
	anObject parent addChild: anObject after: leftChild
]
