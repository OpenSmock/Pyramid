Class {
	#name : #PyramidIncreaseMockCommand,
	#superclass : #PyramidMockCommand,
	#category : #'Pyramid-commands'
}

{ #category : #'as yet unclassified' }
PyramidIncreaseMockCommand >> commandInverse [

	^ PyramidDecreaseMockCommand new
]

{ #category : #'as yet unclassified' }
PyramidIncreaseMockCommand >> getValueFor: anObject [

	^ nil
]

{ #category : #'as yet unclassified' }
PyramidIncreaseMockCommand >> setValueFor: anObject with: anArgument [

	anObject count: anObject count + 1
]
