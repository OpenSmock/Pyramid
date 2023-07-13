Class {
	#name : #NeoPyramidMockObjectForTest,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#category : #'NeoPyramid-tests'
}

{ #category : #accessing }
NeoPyramidMockObjectForTest >> count [

	^ count
]

{ #category : #accessing }
NeoPyramidMockObjectForTest >> count: anObject [

	count := anObject
]

{ #category : #initialization }
NeoPyramidMockObjectForTest >> initialize [

	count := 0.
]
