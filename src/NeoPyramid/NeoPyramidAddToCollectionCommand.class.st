Class {
	#name : #NeoPyramidAddToCollectionCommand,
	#superclass : #NeoPyramidCollectionCommand,
	#category : #'NeoPyramid-command'
}

{ #category : #'as yet unclassified' }
NeoPyramidAddToCollectionCommand >> commandInverse [

	^ NeoPyramidRemoveFromCollectionCommand new
]

{ #category : #'as yet unclassified' }
NeoPyramidAddToCollectionCommand >> getValueFor: anObject [

	^ nil
]

{ #category : #'as yet unclassified' }
NeoPyramidAddToCollectionCommand >> setValueFor: anObject with: anArgument [

	anObject add: anArgument
]
