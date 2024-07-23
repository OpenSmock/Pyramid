Class {
	#name : #PyramidBorderPaintRadialOuterRadiusCommand,
	#superclass : #PyramidBorderPaintRadialCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #'as yet unclassified' }
PyramidBorderPaintRadialOuterRadiusCommand >> getValueFor: aBlElement [

	^ aBlElement border paint outerRadius
]

{ #category : #'as yet unclassified' }
PyramidBorderPaintRadialOuterRadiusCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder paint outerRadius: anArgument
]
