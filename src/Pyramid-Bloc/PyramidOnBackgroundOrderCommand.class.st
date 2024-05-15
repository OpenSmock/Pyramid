Class {
	#name : 'PyramidOnBackgroundOrderCommand',
	#superclass : 'PyramidAbstractChangeDrawOrderCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-order',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-order'
}

{ #category : 'as yet unclassified' }
PyramidOnBackgroundOrderCommand >> commandInverse [

	^ PyramidChangeOrderWithIndexCommand new
]

{ #category : 'as yet unclassified' }
PyramidOnBackgroundOrderCommand >> setValueFor: aBlElement with: anArgument [

	| currentIndex parent |
	currentIndex := self getValueFor: aBlElement.
	parent := aBlElement parent.
	parent childrenCount <= 1 ifTrue: [ ^ self ].
	parent removeChild: aBlElement.
	parent addChild: aBlElement at: 1
]
