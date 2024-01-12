Class {
	#name : #PyramidValueCommandTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-command'
}

{ #category : #tests }
PyramidValueCommandTest >> testGetValueFor [

	| mock command |
	mock := PyramidMockObjectForTest new.
	mock count: 10.
	command := PyramidValueCommand new
		           reader: [ :e | e count ];
		           writer: [ :e :a | e count: a ];
		           yourself.
	self assert: (command getValueFor: mock) equals: 10.
	mock count: 11.
	self assert: (command getValueFor: mock) equals: 11
]

{ #category : #tests }
PyramidValueCommandTest >> testSetValueForWith [

	| mock command |
	mock := PyramidMockObjectForTest new.
	command := PyramidValueCommand new
		           reader: [ :e | e count ];
		writer: [ :e :a | e count: a ];
		           yourself.
	command setValueFor: mock with: 10.
	self assert: mock count equals: 10.
	command setValueFor: mock with: 11.
	self assert: mock count equals: 11
]
