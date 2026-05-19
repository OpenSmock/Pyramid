Class {
	#name : #PyramidBorderPaintCommand,
	#superclass : #PyramidAbstractBorderCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #getter }
PyramidBorderPaintCommand >> getValueFor: aBlElement [

	^ aBlElement border paint
]

{ #category : #'as yet unclassified' }
PyramidBorderPaintCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder paint: anArgument value
]
