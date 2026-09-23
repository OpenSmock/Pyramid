Class {
	#name : #PyramidMoveBackwardOrderCommand,
	#superclass : #PyramidAbstractChangeDrawOrderCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-order'
}

{ #category : #history }
PyramidMoveBackwardOrderCommand >> commandInverse [

	^ PyramidMoveForwardOrderCommand new
]

{ #category : #setter }
PyramidMoveBackwardOrderCommand >> setValueFor: aBlElement with: anArgument [

	| currentIndex |
	currentIndex := self getValueFor: aBlElement.
	currentIndex = 1 ifTrue: [ ^ self ].
	aBlElement parent swapChildAt: currentIndex with: currentIndex - 1
]
