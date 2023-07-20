Class {
	#name : #NeoPyramidClipChildrenCommand,
	#superclass : #NeoPyramidBlocCommand,
	#category : #'NeoPyramid-command'
}

{ #category : #'as yet unclassified' }
NeoPyramidClipChildrenCommand >> getValueFor: aBlElement [

	^ aBlElement clipChildren
]

{ #category : #'as yet unclassified' }
NeoPyramidClipChildrenCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement clipChildren: anArgument
]
