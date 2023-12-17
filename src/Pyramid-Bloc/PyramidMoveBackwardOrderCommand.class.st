Class {
	#name : #PyramidMoveBackwardOrderCommand,
	#superclass : #PyramidAbstractChangeDrawOrderCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-order'
}

{ #category : #'as yet unclassified' }
PyramidMoveBackwardOrderCommand >> commandInverse [

	^ PyramidMoveForwardOrderCommand new
]

{ #category : #'as yet unclassified' }
PyramidMoveBackwardOrderCommand >> setValueFor: aBlElement with: anArgument [

	| currentIndex |
	currentIndex := self getValueFor: aBlElement.
	currentIndex = 1 ifTrue: [ ^ self ].
	aBlElement parent swapChildAt: currentIndex with: currentIndex - 1
]
