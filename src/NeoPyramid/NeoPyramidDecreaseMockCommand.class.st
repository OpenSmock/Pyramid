Class {
	#name : #NeoPyramidDecreaseMockCommand,
	#superclass : #NeoPyramidMockCommand,
	#category : #'NeoPyramid-command'
}

{ #category : #'as yet unclassified' }
NeoPyramidDecreaseMockCommand >> commandInverse [

	^ NeoPyramidIncreaseMockCommand new
]

{ #category : #'as yet unclassified' }
NeoPyramidDecreaseMockCommand >> getValueFor: anObject [

^ nil
]

{ #category : #'as yet unclassified' }
NeoPyramidDecreaseMockCommand >> setValueFor: anObject with: anArgument [

	anObject count: anObject count - 1
]
