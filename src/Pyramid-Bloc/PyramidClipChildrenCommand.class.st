Class {
	#name : #PyramidClipChildrenCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #getter }
PyramidClipChildrenCommand >> getValueFor: aBlElement [

	^ aBlElement clipChildren
]

{ #category : #setter }
PyramidClipChildrenCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement clipChildren: anArgument
]
