Class {
	#name : #NeoPyramidRemoveFromCollectionCommand,
	#superclass : #NeoPyramidCollectionCommand,
	#category : #'NeoPyramid-command'
}

{ #category : #'as yet unclassified' }
NeoPyramidRemoveFromCollectionCommand >> commandInverse [

	^ NeoPyramidAddToCollectionCommand new
]

{ #category : #'as yet unclassified' }
NeoPyramidRemoveFromCollectionCommand >> getValueFor: anObject [

	^ nil
]

{ #category : #'as yet unclassified' }
NeoPyramidRemoveFromCollectionCommand >> setValueFor: anObject with: anArgument [

	anObject remove: anArgument
]
