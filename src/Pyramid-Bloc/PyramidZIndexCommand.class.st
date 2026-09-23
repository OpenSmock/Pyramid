Class {
	#name : #PyramidZIndexCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #getter }
PyramidZIndexCommand >> getValueFor: aBlElement [

	^ aBlElement elevation elevation
]

{ #category : #setter }
PyramidZIndexCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement zIndex: anArgument
]
