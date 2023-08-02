Class {
	#name : #PyramidVisibilityCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'as yet unclassified' }
PyramidVisibilityCommand >> getValueFor: aBlElement [

	^ aBlElement visibility
]

{ #category : #'as yet unclassified' }
PyramidVisibilityCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement visibility: anArgument
]
