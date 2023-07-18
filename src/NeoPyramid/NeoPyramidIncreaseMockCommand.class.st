Class {
	#name : #NeoPyramidIncreaseMockCommand,
	#superclass : #NeoPyramidMockCommand,
	#category : #'NeoPyramid-command'
}

{ #category : #'as yet unclassified' }
NeoPyramidIncreaseMockCommand >> commandInverse [

	^ NeoPyramidDecreaseMockCommand new
]

{ #category : #'as yet unclassified' }
NeoPyramidIncreaseMockCommand >> getValueFor: anObject [

	^ nil
]

{ #category : #'as yet unclassified' }
NeoPyramidIncreaseMockCommand >> setValueFor: anObject with: anArgument [

	anObject count: anObject count + 1
]
