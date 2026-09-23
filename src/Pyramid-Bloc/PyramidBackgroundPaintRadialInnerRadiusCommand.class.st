Class {
	#name : #PyramidBackgroundPaintRadialInnerRadiusCommand,
	#superclass : #PyramidBackgroundPaintRadialCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #getter }
PyramidBackgroundPaintRadialInnerRadiusCommand >> getValueFor: aBlElement [

	^ aBlElement background paint innerRadius
]

{ #category : #setter }
PyramidBackgroundPaintRadialInnerRadiusCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background paint innerRadius: anArgument
]
