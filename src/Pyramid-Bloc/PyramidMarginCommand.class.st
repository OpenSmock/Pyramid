Class {
	#name : #PyramidMarginCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #getter }
PyramidMarginCommand >> getValueFor: aBlElement [

	^ aBlElement margin
]

{ #category : #setter }
PyramidMarginCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement margin: anArgument
]
