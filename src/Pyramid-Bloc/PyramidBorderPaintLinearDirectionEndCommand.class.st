Class {
	#name : 'PyramidBorderPaintLinearDirectionEndCommand',
	#superclass : 'PyramidBorderPaintLinearDirectionCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-background',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-background'
}

{ #category : 'as yet unclassified' }
PyramidBorderPaintLinearDirectionEndCommand >> getValueFor: aBlElement [

	^ aBlElement border paint end
]

{ #category : 'as yet unclassified' }
PyramidBorderPaintLinearDirectionEndCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder paint end: anArgument
]
