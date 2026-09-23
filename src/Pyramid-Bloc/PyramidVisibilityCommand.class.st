Class {
	#name : #PyramidVisibilityCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #getter }
PyramidVisibilityCommand >> getValueFor: aBlElement [

	^ aBlElement visibility
]

{ #category : #setter }
PyramidVisibilityCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement visibility: anArgument
]
