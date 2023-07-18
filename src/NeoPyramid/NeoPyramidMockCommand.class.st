Class {
	#name : #NeoPyramidMockCommand,
	#superclass : #NeoPyramidCommand,
	#category : #'NeoPyramid-command'
}

{ #category : #testing }
NeoPyramidMockCommand class >> isAbstract [

	^ self == NeoPyramidMockCommand
]

{ #category : #testing }
NeoPyramidMockCommand >> canBeUsedFor: anObject [

	^ anObject class = NeoPyramidMockObjectForTest
]
