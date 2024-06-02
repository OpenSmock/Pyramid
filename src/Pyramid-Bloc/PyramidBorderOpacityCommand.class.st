Class {
	#name : 'PyramidBorderOpacityCommand',
	#superclass : 'PyramidAbstractBorderCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-visuals',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-visuals'
}

{ #category : 'as yet unclassified' }
PyramidBorderOpacityCommand >> getValueFor: aBlElement [

	^ aBlElement border opacity
]

{ #category : 'as yet unclassified' }
PyramidBorderOpacityCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder opacity: anArgument
]
