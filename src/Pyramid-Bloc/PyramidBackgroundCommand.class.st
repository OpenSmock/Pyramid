Class {
	#name : #PyramidBackgroundCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-background'
}

{ #category : #'as yet unclassified' }
PyramidBackgroundCommand >> getValueFor: aBlElement [

	^ aBlElement background
]

{ #category : #'as yet unclassified' }
PyramidBackgroundCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background: anArgument
]
