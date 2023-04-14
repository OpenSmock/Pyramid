Class {
	#name : #PyramidKindOfVerifierStrategy,
	#superclass : #PyramidTargetVerifierStrategy,
	#instVars : [
		'classesToTest',
		'classToTest'
	],
	#category : #'NeoPyramid-plugin-commands'
}

{ #category : #accessing }
PyramidKindOfVerifierStrategy >> classToTest [

	^ classToTest
]

{ #category : #accessing }
PyramidKindOfVerifierStrategy >> classToTest: anObject [

	classToTest := anObject
]

{ #category : #testing }
PyramidKindOfVerifierStrategy >> isKindOf [
	^ true
]

{ #category : #'as yet unclassified' }
PyramidKindOfVerifierStrategy >> verify: anObject [

	^ anObject isKindOf: self classToTest
]
