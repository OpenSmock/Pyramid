Class {
	#name : #PyramidHistoryTestDummy,
	#superclass : #Object,
	#instVars : [
		'integer'
	],
	#category : #'NeoPyramid-plugin-history'
}

{ #category : #'actions api' }
PyramidHistoryTestDummy >> get [
	^ integer
]

{ #category : #initialization }
PyramidHistoryTestDummy >> initialize [

	integer := 0
]

{ #category : #'actions api' }
PyramidHistoryTestDummy >> set: anObject [

	integer := anObject
]
