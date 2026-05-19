Class {
	#name : #PyramidBorderPaintLinearDirectionStartCommand,
	#superclass : #PyramidBorderPaintLinearDirectionCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #getter }
PyramidBorderPaintLinearDirectionStartCommand >> getValueFor: aBlElement [

	^ aBlElement border paint start
]

{ #category : #'as yet unclassified' }
PyramidBorderPaintLinearDirectionStartCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder paint start: anArgument
]
