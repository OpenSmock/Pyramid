Class {
	#name : #PyramidBackgroundPaintRadialInnerRadiusCommand,
	#superclass : #PyramidBackgroundPaintRadialCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-background'
}

{ #category : #'as yet unclassified' }
PyramidBackgroundPaintRadialInnerRadiusCommand >> getValueFor: aBlElement [

	^ aBlElement background paint innerRadius
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPaintRadialInnerRadiusCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background paint innerRadius: anArgument
]
