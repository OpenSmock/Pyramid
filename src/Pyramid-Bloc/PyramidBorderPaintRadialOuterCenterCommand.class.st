Class {
	#name : 'PyramidBorderPaintRadialOuterCenterCommand',
	#superclass : 'PyramidBorderPaintRadialCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-visuals',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-visuals'
}

{ #category : 'as yet unclassified' }
PyramidBorderPaintRadialOuterCenterCommand >> getValueFor: aBlElement [

	^ aBlElement border paint outerCenter
]

{ #category : 'as yet unclassified' }
PyramidBorderPaintRadialOuterCenterCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder paint outerCenter: anArgument
]
