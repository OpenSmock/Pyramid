Class {
	#name : #PyramidSimpleMockCommand,
	#superclass : #PyramidMockCommand,
	#category : #'Pyramid-Tests-cases-command'
}

{ #category : #getter }
PyramidSimpleMockCommand >> getValueFor: anObject [

	^ anObject count.
]

{ #category : #setter }
PyramidSimpleMockCommand >> setValueFor: anObject with: anArgument [

	anObject count: anArgument
]
