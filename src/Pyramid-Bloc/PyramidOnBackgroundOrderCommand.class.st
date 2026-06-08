Class {
	#name : #PyramidOnBackgroundOrderCommand,
	#superclass : #PyramidAbstractChangeDrawOrderCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-order'
}

{ #category : #history }
PyramidOnBackgroundOrderCommand >> commandInverse [

	^ PyramidChangeOrderWithIndexCommand new
]

{ #category : #setter }
PyramidOnBackgroundOrderCommand >> setValueFor: aBlElement with: anArgument [

	| currentIndex parent |
	currentIndex := self getValueFor: aBlElement.
	parent := aBlElement parent.
	parent childrenCount <= 1 ifTrue: [ ^ self ].
	parent removeChild: aBlElement.
	parent addChild: aBlElement at: 1
]
