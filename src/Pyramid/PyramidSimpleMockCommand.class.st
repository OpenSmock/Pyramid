Class {
	#name : #PyramidSimpleMockCommand,
	#superclass : #PyramidMockCommand,
	#category : #'Pyramid-commands'
}

{ #category : #'as yet unclassified' }
PyramidSimpleMockCommand >> getValueFor: anObject [

	^ anObject count.
]

{ #category : #'as yet unclassified' }
PyramidSimpleMockCommand >> setValueFor: anObject with: anArgument [

	anObject count: anArgument
]
