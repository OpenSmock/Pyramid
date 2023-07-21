Class {
	#name : #PyramidMockCommand,
	#superclass : #PyramidCommand,
	#category : #'Pyramid-commands'
}

{ #category : #testing }
PyramidMockCommand class >> isAbstract [

	^ self == PyramidMockCommand
]

{ #category : #testing }
PyramidMockCommand >> canBeUsedFor: anObject [

	^ anObject class = PyramidMockObjectForTest
]
