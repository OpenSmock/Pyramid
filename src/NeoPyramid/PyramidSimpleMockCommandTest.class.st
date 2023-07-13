Class {
	#name : #PyramidSimpleMockCommandTest,
	#superclass : #TestCase,
	#category : #'NeoPyramid-tests'
}

{ #category : #'as yet unclassified' }
PyramidSimpleMockCommandTest >> testGetValueFor [

	| mock |
	mock := NeoPyramidMockObjectForTest new.
	self assert: (NeoPyramidSimpleMockCommand new getValueFor: mock) equals: 0.
	
	mock count: 5.
	self assert: (NeoPyramidSimpleMockCommand new getValueFor: mock) equals: 5.
]

{ #category : #'as yet unclassified' }
PyramidSimpleMockCommandTest >> testSetValueForWith [

	| mock |
	mock := NeoPyramidMockObjectForTest new.
	self assert: mock count equals: 0.
	
	NeoPyramidSimpleMockCommand new setValueFor: mock with: 5. 
	self assert: mock count equals: 5.
]
