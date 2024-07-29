Class {
	#name : #PyramidBorderLineCapCommand,
	#superclass : #PyramidAbstractBorderCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #'as yet unclassified' }
PyramidBorderLineCapCommand >> getValueFor: aBlElement [

	^ aBlElement border style lineCap
]

{ #category : #'as yet unclassified' }
PyramidBorderLineCapCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder lineCap: anArgument
]
