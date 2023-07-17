Class {
	#name : #NeoPyramidRemoveMockCommand,
	#superclass : #NeoPyramidMockCommand,
	#category : #'NeoPyramid-command'
}

{ #category : #'as yet unclassified' }
NeoPyramidRemoveMockCommand >> commandInverse [

	^ NeoPyramidAddMockCommand new
]

{ #category : #'as yet unclassified' }
NeoPyramidRemoveMockCommand >> getValueFor: anObject [

^ nil
]

{ #category : #'as yet unclassified' }
NeoPyramidRemoveMockCommand >> setValueFor: anObject with: anArgument [

	anObject count: anObject count - 1
]
