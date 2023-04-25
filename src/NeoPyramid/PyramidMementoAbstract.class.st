Class {
	#name : #PyramidMementoAbstract,
	#superclass : #Object,
	#instVars : [
		'pipeline'
	],
	#category : #'NeoPyramid-plugin-history'
}

{ #category : #testing }
PyramidMementoAbstract >> isSequence [
^false
]

{ #category : #accessing }
PyramidMementoAbstract >> pipeline [

	^ pipeline
]

{ #category : #accessing }
PyramidMementoAbstract >> pipeline: anObject [

	pipeline := anObject
]

{ #category : #'window management' }
PyramidMementoAbstract >> restore [

	self shouldBeImplemented 
]
