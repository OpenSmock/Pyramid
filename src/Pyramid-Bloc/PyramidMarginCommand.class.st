Class {
	#name : #PyramidMarginCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidMarginCommand >> getValueFor: aBlElement [

	^ aBlElement margin
]

{ #category : #'as yet unclassified' }
PyramidMarginCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement margin: anArgument
]
