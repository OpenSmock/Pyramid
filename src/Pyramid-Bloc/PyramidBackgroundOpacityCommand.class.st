Class {
	#name : 'PyramidBackgroundOpacityCommand',
	#superclass : 'PyramidAbstractBlocCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-visuals',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-visuals'
}

{ #category : 'as yet unclassified' }
PyramidBackgroundOpacityCommand >> getValueFor: aBlElement [

	^ aBlElement background opacity
]

{ #category : 'as yet unclassified' }
PyramidBackgroundOpacityCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background opacity: anArgument
]
