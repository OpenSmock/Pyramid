Class {
	#name : 'PyramidBackgroundPaintLinearStartCommand',
	#superclass : 'PyramidBackgroundPaintLinearDirectionCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-visuals',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-visuals'
}

{ #category : 'as yet unclassified' }
PyramidBackgroundPaintLinearStartCommand >> getValueFor: aBlElement [

	^ aBlElement background paint start
]

{ #category : 'as yet unclassified' }
PyramidBackgroundPaintLinearStartCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background paint start: anArgument
]
