Class {
	#name : 'PyramidPaddingCommand',
	#superclass : 'PyramidAbstractBlocCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-layout',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-layout'
}

{ #category : 'as yet unclassified' }
PyramidPaddingCommand >> getValueFor: aBlElement [

	^ aBlElement padding
]

{ #category : 'as yet unclassified' }
PyramidPaddingCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement padding: anArgument
]
