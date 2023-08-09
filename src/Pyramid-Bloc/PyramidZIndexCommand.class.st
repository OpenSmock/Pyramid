Class {
	#name : #PyramidZIndexCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'as yet unclassified' }
PyramidZIndexCommand >> getValueFor: aBlElement [

	^ aBlElement elevation elevation
]

{ #category : #'as yet unclassified' }
PyramidZIndexCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement zIndex: anArgument
]
