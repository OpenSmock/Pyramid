Class {
	#name : 'PyramidBorderPaintRadialOuterCenterCommand',
	#superclass : 'PyramidBorderPaintRadialCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-background',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-background'
}

{ #category : 'as yet unclassified' }
PyramidBorderPaintRadialOuterCenterCommand >> getValueFor: aBlElement [

	^ aBlElement border paint outerCenter
]

{ #category : 'as yet unclassified' }
PyramidBorderPaintRadialOuterCenterCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder paint outerCenter: anArgument
]
