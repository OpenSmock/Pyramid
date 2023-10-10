Class {
	#name : 'PyramidAddMockCommandTest',
	#superclass : 'TestCase',
	#category : 'Pyramid-Tests-cases-command',
	#package : 'Pyramid-Tests',
	#tag : 'cases-command'
}

{ #category : 'tests' }
PyramidAddMockCommandTest >> testGetValueFor [

	| mock |
	mock := PyramidMockObjectForTest new.
	self assert: (PyramidIncreaseMockCommand new getValueFor: mock) equals: nil.
	
	mock count: 5.
	self assert: (PyramidIncreaseMockCommand new getValueFor: mock) equals: nil.
]

{ #category : 'tests' }
PyramidAddMockCommandTest >> testSetValueForWith [

	| mock |
	mock := PyramidMockObjectForTest new.
	self assert: mock count equals: 0.
	
	PyramidIncreaseMockCommand new setValueFor: mock with: nil. 
	self assert: mock count equals: 1.
]
