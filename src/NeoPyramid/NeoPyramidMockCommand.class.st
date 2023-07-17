Class {
	#name : #NeoPyramidMockCommand,
	#superclass : #NeoPyramidCommand,
	#category : #'NeoPyramid-command'
}

{ #category : #testing }
NeoPyramidMockCommand >> canBeUsedFor: anObject [

	^ anObject class = NeoPyramidMockObjectForTest
]
