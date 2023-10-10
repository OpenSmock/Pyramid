Class {
	#name : 'PyramidMockObjectForTest',
	#superclass : 'Object',
	#instVars : [
		'count'
	],
	#category : 'Pyramid-Tests-cases-command',
	#package : 'Pyramid-Tests',
	#tag : 'cases-command'
}

{ #category : 'accessing' }
PyramidMockObjectForTest >> count [

	^ count
]

{ #category : 'accessing' }
PyramidMockObjectForTest >> count: anObject [

	count := anObject
]

{ #category : 'initialization' }
PyramidMockObjectForTest >> initialize [

	count := 0.
]
