Class {
	#name : #PyramidIncreaseMockCommand,
	#superclass : #PyramidMockCommand,
	#category : #'Pyramid-Tests-cases-command'
}

{ #category : #history }
PyramidIncreaseMockCommand >> commandInverse [

	^ PyramidDecreaseMockCommand new
]

{ #category : #getter }
PyramidIncreaseMockCommand >> getValueFor: anObject [

	^ nil
]

{ #category : #setter }
PyramidIncreaseMockCommand >> setValueFor: anObject with: anArgument [

	anObject count: anObject count + 1
]
