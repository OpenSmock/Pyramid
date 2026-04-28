Class {
	#name : #PyramidDecreaseMockCommand,
	#superclass : #PyramidMockCommand,
	#category : #'Pyramid-Tests-cases-command'
}

{ #category : #history }
PyramidDecreaseMockCommand >> commandInverse [

	^ PyramidIncreaseMockCommand new
]

{ #category : #getter }
PyramidDecreaseMockCommand >> getValueFor: anObject [

^ nil
]

{ #category : #setter }
PyramidDecreaseMockCommand >> setValueFor: anObject with: anArgument [

	anObject count: anObject count - 1
]
