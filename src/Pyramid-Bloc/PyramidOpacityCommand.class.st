Class {
	#name : #PyramidOpacityCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #getter }
PyramidOpacityCommand >> getValueFor: aBlElement [

	^ aBlElement opacity
]

{ #category : #setter }
PyramidOpacityCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement opacity: anArgument
]
