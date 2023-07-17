Class {
	#name : #NeoPyramidElementIdCommand,
	#superclass : #NeoPyramidBlocCommand,
	#category : #'NeoPyramid-command'
}

{ #category : #'as yet unclassified' }
NeoPyramidElementIdCommand >> getValueFor: aBlElement [

	^ aBlElement id asSymbol
]

{ #category : #'as yet unclassified' }
NeoPyramidElementIdCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement id: anArgument
]
