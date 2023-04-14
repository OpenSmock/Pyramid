Class {
	#name : #PyramidTargetVerifierStrategy,
	#superclass : #Object,
	#category : #'NeoPyramid-plugin-commands'
}

{ #category : #testing }
PyramidTargetVerifierStrategy >> isKindOf [

	^ false
]

{ #category : #testing }
PyramidTargetVerifierStrategy >> isPrimitive [

	^ false
]

{ #category : #'as yet unclassified' }
PyramidTargetVerifierStrategy >> verify: anObject [

	^ self shouldBeImplemented
]
