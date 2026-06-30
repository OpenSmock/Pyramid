Class {
	#name : #PyramidBackgroundPaintLinearEndCommand,
	#superclass : #PyramidBackgroundPaintLinearDirectionCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #getter }
PyramidBackgroundPaintLinearEndCommand >> getValueFor: aBlElement [

	^ aBlElement background paint end
]

{ #category : #setter }
PyramidBackgroundPaintLinearEndCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background paint end: anArgument
]
