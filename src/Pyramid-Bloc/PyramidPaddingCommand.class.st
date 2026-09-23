Class {
	#name : #PyramidPaddingCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #getter }
PyramidPaddingCommand >> getValueFor: aBlElement [

	^ aBlElement padding
]

{ #category : #setter }
PyramidPaddingCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement padding: anArgument
]
