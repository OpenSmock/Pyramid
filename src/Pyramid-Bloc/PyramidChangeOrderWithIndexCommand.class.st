Class {
	#name : #PyramidChangeOrderWithIndexCommand,
	#superclass : #PyramidAbstractChangeDrawOrderCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-order'
}

{ #category : #'as yet unclassified' }
PyramidChangeOrderWithIndexCommand >> setValueFor: aBlElement with: anArgument [

	| currentIndex parent |
	currentIndex := self getValueFor: aBlElement.
	parent := aBlElement parent.
	(anArgument between: 1 and: parent childrenCount) ifFalse: [ ^ self ].

	parent removeChild: aBlElement.
	parent  addChild: aBlElement at: anArgument
]
