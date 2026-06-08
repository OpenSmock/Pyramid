Class {
	#name : #PyramidBackgroundPaintRadialInnerCenterCommand,
	#superclass : #PyramidBackgroundPaintRadialCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #getter }
PyramidBackgroundPaintRadialInnerCenterCommand >> getValueFor: aBlElement [

	^ aBlElement background paint innerCenter
]

{ #category : #setter }
PyramidBackgroundPaintRadialInnerCenterCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background paint innerCenter: anArgument

]
