Class {
	#name : 'PyramidBackgroundPaintLinearStartCommand',
	#superclass : 'PyramidBackgroundPaintLinearDirectionCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-background',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-background'
}

{ #category : 'as yet unclassified' }
PyramidBackgroundPaintLinearStartCommand >> getValueFor: aBlElement [

	^ aBlElement background paint start
]

{ #category : 'as yet unclassified' }
PyramidBackgroundPaintLinearStartCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background paint start: anArgument
]
