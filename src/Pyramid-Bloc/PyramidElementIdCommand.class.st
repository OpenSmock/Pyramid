Class {
	#name : 'PyramidElementIdCommand',
	#superclass : 'PyramidAbstractBlocCommand',
	#category : 'Pyramid-Bloc-plugin-bloc',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc'
}

{ #category : 'as yet unclassified' }
PyramidElementIdCommand >> getValueFor: aBlElement [

	^ aBlElement id
]

{ #category : 'as yet unclassified' }
PyramidElementIdCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement id: anArgument
]
