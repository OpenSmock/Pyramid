Class {
	#name : 'PyramidBorderPaintRadialOuterRadiusCommand',
	#superclass : 'PyramidBorderPaintRadialCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-background',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-background'
}

{ #category : 'as yet unclassified' }
PyramidBorderPaintRadialOuterRadiusCommand >> getValueFor: aBlElement [

	^ aBlElement border paint outerRadius
]

{ #category : 'as yet unclassified' }
PyramidBorderPaintRadialOuterRadiusCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder paint outerRadius: anArgument
]
