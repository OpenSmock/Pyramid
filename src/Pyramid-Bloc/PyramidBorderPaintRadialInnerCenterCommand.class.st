Class {
	#name : 'PyramidBorderPaintRadialInnerCenterCommand',
	#superclass : 'PyramidBorderPaintRadialCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-background',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-background'
}

{ #category : 'as yet unclassified' }
PyramidBorderPaintRadialInnerCenterCommand >> getValueFor: aBlElement [

	^ aBlElement border paint innerCenter
]

{ #category : 'as yet unclassified' }
PyramidBorderPaintRadialInnerCenterCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder paint innerCenter: anArgument
]
