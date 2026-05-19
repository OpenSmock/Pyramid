Class {
	#name : #PyramidOnForegroundOrderCommand,
	#superclass : #PyramidAbstractChangeDrawOrderCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-order'
}

{ #category : #history }
PyramidOnForegroundOrderCommand >> commandInverse [

	^ PyramidChangeOrderWithIndexCommand new
]

{ #category : #setter }
PyramidOnForegroundOrderCommand >> setValueFor: aBlElement with: anArgument [

	| currentIndex parent |
	currentIndex := self getValueFor: aBlElement.
	parent := aBlElement parent.
	parent childrenCount <= 1 ifTrue: [ ^ self ].
	parent removeChild: aBlElement.
	parent addChild: aBlElement at: parent childrenCount + 1
]
