Class {
	#name : #NeoPyramidSimpleMockCommand,
	#superclass : #NeoPyramidMockCommand,
	#category : #NeoPyramid
}

{ #category : #'as yet unclassified' }
NeoPyramidSimpleMockCommand >> getValueFor: anObject [

	^ anObject count.
]

{ #category : #'as yet unclassified' }
NeoPyramidSimpleMockCommand >> setValueFor: anObject with: anArgument [

	anObject count: anArgument
]
