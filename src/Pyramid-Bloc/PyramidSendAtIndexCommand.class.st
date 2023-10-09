Class {
	#name : 'PyramidSendAtIndexCommand',
	#superclass : 'PyramidAbstractChangePositionWithSiblingsCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-siblings',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-siblings'
}

{ #category : 'as yet unclassified' }
PyramidSendAtIndexCommand >> setValueFor: anObject with: anArgument [

	| currentIndex |
	anObject zIndex: anArgument zIndex.
	
	currentIndex := anObject parent childIndexOf: anObject.
	anObject parent swapChildAt: currentIndex with: anArgument childIndex.
]
