Class {
	#name : #PyramidRemoveMockCommandTest,
	#superclass : #TestCase,
	#category : 'Pyramid-Tests-cases-command'
}

{ #category : #tests }
PyramidRemoveMockCommandTest >> testGetValueFor [

	| mock |
	mock := PyramidMockObjectForTest new.
	self assert: (PyramidDecreaseMockCommand new getValueFor: mock) equals: nil.
	
	mock count: 5.
	self assert: (PyramidDecreaseMockCommand new getValueFor: mock) equals: nil.
]

{ #category : #tests }
PyramidRemoveMockCommandTest >> testSetValueForWith [

	| mock |
	mock := PyramidMockObjectForTest new.
	self assert: mock count equals: 0.
	
	PyramidDecreaseMockCommand new setValueFor: mock with: nil. 
	self assert: mock count equals: -1.
]
