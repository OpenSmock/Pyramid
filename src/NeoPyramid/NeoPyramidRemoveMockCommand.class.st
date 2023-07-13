Class {
	#name : #NeoPyramidRemoveMockCommand,
	#superclass : #NeoPyramidMockCommand,
	#category : #NeoPyramid
}

{ #category : #'as yet unclassified' }
NeoPyramidRemoveMockCommand >> getValueFor: anObject [

^ nil
]

{ #category : #'as yet unclassified' }
NeoPyramidRemoveMockCommand >> restaurationCommand [

	^ NeoPyramidAddMockCommand new
]

{ #category : #'as yet unclassified' }
NeoPyramidRemoveMockCommand >> setValueFor: anObject with: anArgument [

	anObject count: anObject count - 1
]
