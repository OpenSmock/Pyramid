Class {
	#name : #PyramidAddMockCommandTest,
	#superclass : #TestCase,
	#category : #'NeoPyramid-tests'
}

{ #category : #tests }
PyramidAddMockCommandTest >> testGetValueFor [

	| mock |
	mock := NeoPyramidMockObjectForTest new.
	self assert: (NeoPyramidAddMockCommand new getValueFor: mock) equals: nil.
	
	mock count: 5.
	self assert: (NeoPyramidAddMockCommand new getValueFor: mock) equals: nil.
]

{ #category : #tests }
PyramidAddMockCommandTest >> testSetValueForWith [

	| mock |
	mock := NeoPyramidMockObjectForTest new.
	self assert: mock count equals: 0.
	
	NeoPyramidAddMockCommand new setValueFor: mock with: nil. 
	self assert: mock count equals: 1.
]
