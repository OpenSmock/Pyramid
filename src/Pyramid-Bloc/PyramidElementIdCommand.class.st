Class {
	#name : #PyramidElementIdCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'as yet unclassified' }
PyramidElementIdCommand >> getValueFor: aBlElement [

	^ aBlElement id asSymbol
]

{ #category : #'as yet unclassified' }
PyramidElementIdCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement id: anArgument
]
