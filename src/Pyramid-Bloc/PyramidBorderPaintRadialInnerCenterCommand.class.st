Class {
	#name : 'PyramidBorderPaintRadialInnerCenterCommand',
	#superclass : 'PyramidBorderPaintRadialCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-visuals',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-visuals'
}

{ #category : 'as yet unclassified' }
PyramidBorderPaintRadialInnerCenterCommand >> getValueFor: aBlElement [

	^ aBlElement border paint innerCenter
]

{ #category : 'as yet unclassified' }
PyramidBorderPaintRadialInnerCenterCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder paint innerCenter: anArgument
]
