Class {
	#name : #PyramidGeometryCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'as yet unclassified' }
PyramidGeometryCommand >> getValueFor: aBlElement [

	^ aBlElement geometry
]

{ #category : #'as yet unclassified' }
PyramidGeometryCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement geometry: anArgument
]
