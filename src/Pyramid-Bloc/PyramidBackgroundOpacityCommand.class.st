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

	| background |
	background :=  aBlElement background paint asBlBackground.
	background opacity: anArgument.
	aBlElement background: background
]
