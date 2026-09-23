Class {
	#name : #PyramidBackgroundPaintRadialOuterCenterCommand,
	#superclass : #PyramidBackgroundPaintRadialCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #getter }
PyramidBackgroundPaintRadialOuterCenterCommand >> getValueFor: aBlElement [

	^ aBlElement background paint outerCenter
]

{ #category : #setter }
PyramidBackgroundPaintRadialOuterCenterCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background paint outerCenter: anArgument
]
