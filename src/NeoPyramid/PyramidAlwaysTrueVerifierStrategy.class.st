Class {
	#name : #PyramidAlwaysTrueVerifierStrategy,
	#superclass : #PyramidTargetVerifierStrategy,
	#category : #'NeoPyramid-plugin-commands'
}

{ #category : #testing }
PyramidAlwaysTrueVerifierStrategy >> isPrimitive [

	^ true
]

{ #category : #'as yet unclassified' }
PyramidAlwaysTrueVerifierStrategy >> verify: anObject [

	^ true
]
