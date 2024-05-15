Class {
	#name : 'PyramidBorderPaintLinearDirectionStartCommand',
	#superclass : 'PyramidBorderPaintLinearDirectionCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-background',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-background'
}

{ #category : 'as yet unclassified' }
PyramidBorderPaintLinearDirectionStartCommand >> getValueFor: aBlElement [

	^ aBlElement border paint start
]

{ #category : 'as yet unclassified' }
PyramidBorderPaintLinearDirectionStartCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder paint start: anArgument
]
