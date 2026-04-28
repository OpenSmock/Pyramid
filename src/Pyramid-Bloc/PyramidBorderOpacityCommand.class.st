Class {
	#name : #PyramidBorderOpacityCommand,
	#superclass : #PyramidAbstractBorderCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #getter }
PyramidBorderOpacityCommand >> getValueFor: aBlElement [

	^ aBlElement border opacity
]

{ #category : #'as yet unclassified' }
PyramidBorderOpacityCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder opacity: anArgument
]
