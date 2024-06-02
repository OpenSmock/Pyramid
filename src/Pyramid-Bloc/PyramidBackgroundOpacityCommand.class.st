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

	aBlElement background: aBlElement background paint asBlBackground.
	aBlElement background opacity: anArgument
]
