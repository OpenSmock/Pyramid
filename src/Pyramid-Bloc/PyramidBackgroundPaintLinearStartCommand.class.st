Class {
	#name : #PyramidBackgroundPaintLinearStartCommand,
	#superclass : #PyramidBackgroundPaintLinearDirectionCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #getter }
PyramidBackgroundPaintLinearStartCommand >> getValueFor: aBlElement [

	^ aBlElement background paint start
]

{ #category : #setter }
PyramidBackgroundPaintLinearStartCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background paint start: anArgument
]
