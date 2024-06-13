Class {
	#name : 'PyramidOpacityCommand',
	#superclass : 'PyramidAbstractBlocCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-visuals',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-visuals'
}

{ #category : 'as yet unclassified' }
PyramidOpacityCommand >> getValueFor: aBlElement [

	^ aBlElement opacity
]

{ #category : 'as yet unclassified' }
PyramidOpacityCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement opacity: anArgument
]
