Class {
	#name : 'PyramidBorderWidthCommand',
	#superclass : 'PyramidAbstractBorderCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-background',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-background'
}

{ #category : 'as yet unclassified' }
PyramidBorderWidthCommand >> getValueFor: aBlElement [

	^ aBlElement border width
]

{ #category : 'as yet unclassified' }
PyramidBorderWidthCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder width: anArgument
]
