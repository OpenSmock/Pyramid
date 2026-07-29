Class {
	#name : #PyramidGeometryCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-editor'
}

{ #category : #getter }
PyramidGeometryCommand >> getValueFor: aBlElement [

	^ aBlElement geometry
]

{ #category : #setter }
PyramidGeometryCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement geometry: anArgument
]
