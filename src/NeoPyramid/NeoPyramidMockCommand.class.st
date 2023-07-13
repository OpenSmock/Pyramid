Class {
	#name : #NeoPyramidMockCommand,
	#superclass : #NeoPyramidCommand,
	#category : #NeoPyramid
}

{ #category : #testing }
NeoPyramidMockCommand >> canBeUsedFor: anObject [

	^ anObject class = NeoPyramidMockObjectForTest
]
