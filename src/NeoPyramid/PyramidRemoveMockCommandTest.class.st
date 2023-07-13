Class {
	#name : #PyramidRemoveMockCommandTest,
	#superclass : #TestCase,
	#category : #'NeoPyramid-tests'
}

{ #category : #tests }
PyramidRemoveMockCommandTest >> testGetValueFor [

	| mock |
	mock := NeoPyramidMockObjectForTest new.
	self assert: (NeoPyramidRemoveMockCommand new getValueFor: mock) equals: nil.
	
	mock count: 5.
	self assert: (NeoPyramidRemoveMockCommand new getValueFor: mock) equals: nil.
]

{ #category : #tests }
PyramidRemoveMockCommandTest >> testSetValueForWith [

	| mock |
	mock := NeoPyramidMockObjectForTest new.
	self assert: mock count equals: 0.
	
	NeoPyramidRemoveMockCommand new setValueFor: mock with: nil. 
	self assert: mock count equals: -1.
]
