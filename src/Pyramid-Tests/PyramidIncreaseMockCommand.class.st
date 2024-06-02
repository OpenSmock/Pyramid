Class {
	#name : 'PyramidIncreaseMockCommand',
	#superclass : 'PyramidMockCommand',
	#category : 'Pyramid-Tests-cases-command',
	#package : 'Pyramid-Tests',
	#tag : 'cases-command'
}

{ #category : 'as yet unclassified' }
PyramidIncreaseMockCommand >> commandInverse [

	^ PyramidDecreaseMockCommand new
]

{ #category : 'as yet unclassified' }
PyramidIncreaseMockCommand >> getValueFor: anObject [

	^ nil
]

{ #category : 'as yet unclassified' }
PyramidIncreaseMockCommand >> setValueFor: anObject with: anArgument [

	anObject count: anObject count + 1
]
