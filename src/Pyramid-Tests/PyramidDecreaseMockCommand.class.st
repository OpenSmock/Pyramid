Class {
	#name : #PyramidDecreaseMockCommand,
	#superclass : #PyramidMockCommand,
	#category : #'Pyramid-Tests-cases-command'
}

{ #category : #'as yet unclassified' }
PyramidDecreaseMockCommand >> commandInverse [

	^ PyramidIncreaseMockCommand new
]

{ #category : #'as yet unclassified' }
PyramidDecreaseMockCommand >> getValueFor: anObject [

^ nil
]

{ #category : #'as yet unclassified' }
PyramidDecreaseMockCommand >> setValueFor: anObject with: anArgument [

	anObject count: anObject count - 1
]
