Class {
	#name : 'PyramidBackgroundPaintRadialInnerCenterCommand',
	#superclass : 'PyramidBackgroundPaintRadialCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-background',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-background'
}

{ #category : 'as yet unclassified' }
PyramidBackgroundPaintRadialInnerCenterCommand >> getValueFor: aBlElement [

	^ aBlElement background paint innerCenter
]

{ #category : 'as yet unclassified' }
PyramidBackgroundPaintRadialInnerCenterCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background paint innerCenter: anArgument

]
