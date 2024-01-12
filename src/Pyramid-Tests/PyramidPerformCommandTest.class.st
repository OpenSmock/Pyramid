Class {
	#name : #PyramidPerformCommandTest,
	#superclass : #TestCase,
	#category : #'Pyramid-Tests-cases-command'
}

{ #category : #tests }
PyramidPerformCommandTest >> testGetValueFor [

	| mock command |
	mock := PyramidMockObjectForTest new.
	mock count: 10.
	command := PyramidPerformCommand new selector: #count; yourself.
	self assert: (command getValueFor: mock) equals: 10.
	mock count: 11.
	self assert: (command getValueFor: mock) equals: 11.
]

{ #category : #tests }
PyramidPerformCommandTest >> testSetValueForWith [

	| mock command |
	mock := PyramidMockObjectForTest new.
	command := PyramidPerformCommand new selector: #count; yourself.
	(command setValueFor: mock with: 10).
	self assert: mock count equals: 10.
	(command setValueFor: mock with: 11).
	self assert: mock count equals: 11.
]
