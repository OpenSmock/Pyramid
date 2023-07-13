Class {
	#name : #NeoPyramidAddMockCommand,
	#superclass : #NeoPyramidMockCommand,
	#category : #NeoPyramid
}

{ #category : #'as yet unclassified' }
NeoPyramidAddMockCommand >> getValueFor: anObject [

	^ nil
]

{ #category : #'as yet unclassified' }
NeoPyramidAddMockCommand >> restaurationCommand [

	^ NeoPyramidRemoveMockCommand new
]

{ #category : #'as yet unclassified' }
NeoPyramidAddMockCommand >> setValueFor: anObject with: anArgument [

	anObject count: anObject count + 1
]
