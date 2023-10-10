Class {
	#name : 'PyramidGeometryCommand',
	#superclass : 'PyramidAbstractBlocCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-geometry',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-geometry'
}

{ #category : 'as yet unclassified' }
PyramidGeometryCommand >> getValueFor: aBlElement [

	^ aBlElement geometry
]

{ #category : 'as yet unclassified' }
PyramidGeometryCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement geometry: anArgument
]
