Class {
	#name : 'PyramidSimpleMockCommandTest',
	#superclass : 'TestCase',
	#category : 'Pyramid-Tests-cases-command',
	#package : 'Pyramid-Tests',
	#tag : 'cases-command'
}

{ #category : 'as yet unclassified' }
PyramidSimpleMockCommandTest >> testGetValueFor [

	| mock |
	mock := PyramidMockObjectForTest new.
	self assert: (PyramidSimpleMockCommand new getValueFor: mock) equals: 0.
	
	mock count: 5.
	self assert: (PyramidSimpleMockCommand new getValueFor: mock) equals: 5.
]

{ #category : 'as yet unclassified' }
PyramidSimpleMockCommandTest >> testSetValueForWith [

	| mock |
	mock := PyramidMockObjectForTest new.
	self assert: mock count equals: 0.
	
	PyramidSimpleMockCommand new setValueFor: mock with: 5. 
	self assert: mock count equals: 5.
]
