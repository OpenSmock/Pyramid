Class {
	#name : #PyramidClipChildrenCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'as yet unclassified' }
PyramidClipChildrenCommand >> getValueFor: aBlElement [

	^ aBlElement clipChildren
]

{ #category : #'as yet unclassified' }
PyramidClipChildrenCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement clipChildren: anArgument
]
