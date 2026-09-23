Class {
	#name : #PyramidBackgroundPaintRadialOuterRadiusCommand,
	#superclass : #PyramidBackgroundPaintRadialCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #getter }
PyramidBackgroundPaintRadialOuterRadiusCommand >> getValueFor: aBlElement [

	^ aBlElement background paint outerRadius
]

{ #category : #setter }
PyramidBackgroundPaintRadialOuterRadiusCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background paint outerRadius: anArgument
]
