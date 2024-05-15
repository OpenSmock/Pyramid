Class {
	#name : 'PyramidBackgroundPaintLinearEndCommand',
	#superclass : 'PyramidBackgroundPaintLinearDirectionCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-background',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-background'
}

{ #category : 'as yet unclassified' }
PyramidBackgroundPaintLinearEndCommand >> getValueFor: aBlElement [

	^ aBlElement background paint end
]

{ #category : 'as yet unclassified' }
PyramidBackgroundPaintLinearEndCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background paint end: anArgument
]
