Class {
	#name : #PyramidBackgroundPaintRadialOuterCenterCommand,
	#superclass : #PyramidBackgroundPaintRadialCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-background'
}

{ #category : #'as yet unclassified' }
PyramidBackgroundPaintRadialOuterCenterCommand >> getValueFor: aBlElement [

	^ aBlElement background paint outerCenter
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPaintRadialOuterCenterCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background paint outerCenter: anArgument
]
