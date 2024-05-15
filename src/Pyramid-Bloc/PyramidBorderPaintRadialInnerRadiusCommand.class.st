Class {
	#name : 'PyramidBorderPaintRadialInnerRadiusCommand',
	#superclass : 'PyramidBorderPaintRadialCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-background',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-background'
}

{ #category : 'as yet unclassified' }
PyramidBorderPaintRadialInnerRadiusCommand >> getValueFor: aBlElement [

	^ aBlElement border paint innerRadius
]

{ #category : 'as yet unclassified' }
PyramidBorderPaintRadialInnerRadiusCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder paint innerRadius: anArgument
]
