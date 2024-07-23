Class {
	#name : #PyramidBorderPaintLinearDirectionEndCommand,
	#superclass : #PyramidBorderPaintLinearDirectionCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #'as yet unclassified' }
PyramidBorderPaintLinearDirectionEndCommand >> getValueFor: aBlElement [

	^ aBlElement border paint end
]

{ #category : #'as yet unclassified' }
PyramidBorderPaintLinearDirectionEndCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder paint end: anArgument
]
