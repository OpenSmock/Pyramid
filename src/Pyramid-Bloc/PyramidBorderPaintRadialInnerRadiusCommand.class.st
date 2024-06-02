Class {
	#name : 'PyramidBorderPaintRadialInnerRadiusCommand',
	#superclass : 'PyramidBorderPaintRadialCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-visuals',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-visuals'
}

{ #category : 'as yet unclassified' }
PyramidBorderPaintRadialInnerRadiusCommand >> getValueFor: aBlElement [

	^ aBlElement border paint innerRadius
]

{ #category : 'as yet unclassified' }
PyramidBorderPaintRadialInnerRadiusCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder paint innerRadius: anArgument
]
