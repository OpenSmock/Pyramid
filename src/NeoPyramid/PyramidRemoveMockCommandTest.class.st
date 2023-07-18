Class {
	#name : #PyramidRemoveMockCommandTest,
	#superclass : #TestCase,
	#category : #'NeoPyramid-cases-command'
}

{ #category : #tests }
PyramidRemoveMockCommandTest >> testGetValueFor [

	| mock |
	mock := NeoPyramidMockObjectForTest new.
	self assert: (NeoPyramidDecreaseMockCommand new getValueFor: mock) equals: nil.
	
	mock count: 5.
	self assert: (NeoPyramidDecreaseMockCommand new getValueFor: mock) equals: nil.
]

{ #category : #tests }
PyramidRemoveMockCommandTest >> testSetValueForWith [

	| mock |
	mock := NeoPyramidMockObjectForTest new.
	self assert: mock count equals: 0.
	
	NeoPyramidDecreaseMockCommand new setValueFor: mock with: nil. 
	self assert: mock count equals: -1.
]
