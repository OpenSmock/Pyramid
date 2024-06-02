Class {
	#name : 'PyramidMockCommand',
	#superclass : 'PyramidCommand',
	#category : 'Pyramid-Tests-cases-command',
	#package : 'Pyramid-Tests',
	#tag : 'cases-command'
}

{ #category : 'testing' }
PyramidMockCommand class >> isAbstract [

	^ self == PyramidMockCommand
]

{ #category : 'testing' }
PyramidMockCommand >> canBeUsedFor: anObject [

	^ anObject class = PyramidMockObjectForTest
]
