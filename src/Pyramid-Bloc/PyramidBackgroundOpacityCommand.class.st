Class {
	#name : #PyramidBackgroundOpacityCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #getter }
PyramidBackgroundOpacityCommand >> getValueFor: aBlElement [

	^ aBlElement background opacity
]

{ #category : #setter }
PyramidBackgroundOpacityCommand >> setValueFor: aBlElement with: anArgument [

	| background |
	background := aBlElement background paint asBlBackground.
	background opacity: anArgument.
	aBlElement background: background
]
