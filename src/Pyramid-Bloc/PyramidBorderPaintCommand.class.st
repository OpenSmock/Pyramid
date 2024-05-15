Class {
	#name : 'PyramidBorderPaintCommand',
	#superclass : 'PyramidAbstractBorderCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-background',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-background'
}

{ #category : 'as yet unclassified' }
PyramidBorderPaintCommand >> getValueFor: aBlElement [

	^ aBlElement border paint
]

{ #category : 'as yet unclassified' }
PyramidBorderPaintCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder paint: anArgument value
]
