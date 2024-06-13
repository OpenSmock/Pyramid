Class {
	#name : 'PyramidBorderDashArrayCommand',
	#superclass : 'PyramidAbstractBorderCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-visuals',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-visuals'
}

{ #category : 'as yet unclassified' }
PyramidBorderDashArrayCommand >> getValueFor: aBlElement [

	^ aBlElement border style dashArray
]

{ #category : 'as yet unclassified' }
PyramidBorderDashArrayCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder dashArray: anArgument
]
