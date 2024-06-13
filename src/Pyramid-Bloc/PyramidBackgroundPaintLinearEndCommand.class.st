Class {
	#name : 'PyramidBackgroundPaintLinearEndCommand',
	#superclass : 'PyramidBackgroundPaintLinearDirectionCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-visuals',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-visuals'
}

{ #category : 'as yet unclassified' }
PyramidBackgroundPaintLinearEndCommand >> getValueFor: aBlElement [

	^ aBlElement background paint end
]

{ #category : 'as yet unclassified' }
PyramidBackgroundPaintLinearEndCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background paint end: anArgument
]
