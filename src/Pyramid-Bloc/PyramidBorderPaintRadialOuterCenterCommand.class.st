Class {
	#name : #PyramidBorderPaintRadialOuterCenterCommand,
	#superclass : #PyramidBorderPaintRadialCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #getter }
PyramidBorderPaintRadialOuterCenterCommand >> getValueFor: aBlElement [

	^ aBlElement border paint outerCenter
]

{ #category : #'as yet unclassified' }
PyramidBorderPaintRadialOuterCenterCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder paint outerCenter: anArgument
]
