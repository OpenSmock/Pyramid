Class {
	#name : 'PyramidBackgroundTypeCommand',
	#superclass : 'PyramidAbstractBlocCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-background',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-background'
}

{ #category : 'as yet unclassified' }
PyramidBackgroundTypeCommand >> getGroupedValueFor: aBlElement [

	^ aBlElement background class
]

{ #category : 'as yet unclassified' }
PyramidBackgroundTypeCommand >> getValueFor: aBlElement [

	^ aBlElement background
]

{ #category : 'as yet unclassified' }
PyramidBackgroundTypeCommand >> setValueFor: aBlElement with: anArgument [
	"Must be a blockClosure to ensure no background are created."

	aBlElement background: anArgument value
]
