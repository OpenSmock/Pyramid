Class {
	#name : #PyramidElementIdCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #getter }
PyramidElementIdCommand >> getValueFor: aBlElement [

	^ aBlElement id
]

{ #category : #setter }
PyramidElementIdCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement id: anArgument
]
