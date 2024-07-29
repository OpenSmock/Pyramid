Class {
	#name : #PyramidMoveForwardOrderCommand,
	#superclass : #PyramidAbstractChangeDrawOrderCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-order'
}

{ #category : #'as yet unclassified' }
PyramidMoveForwardOrderCommand >> commandInverse [

	^ PyramidMoveBackwardOrderCommand new
]

{ #category : #'as yet unclassified' }
PyramidMoveForwardOrderCommand >> setValueFor: aBlElement with: anArgument [

	| currentIndex |
	currentIndex := self getValueFor: aBlElement.
	currentIndex = aBlElement parent childrenCount ifTrue: [ ^ self ].

	aBlElement parent swapChildAt: currentIndex with: currentIndex + 1
]
