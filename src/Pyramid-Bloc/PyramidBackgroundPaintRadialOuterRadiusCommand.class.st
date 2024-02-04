Class {
	#name : #PyramidBackgroundPaintRadialOuterRadiusCommand,
	#superclass : #PyramidBackgroundPaintRadialCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-background'
}

{ #category : #'as yet unclassified' }
PyramidBackgroundPaintRadialOuterRadiusCommand >> getValueFor: aBlElement [

	^ aBlElement background paint outerRadius
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPaintRadialOuterRadiusCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background paint outerRadius: anArgument
]
