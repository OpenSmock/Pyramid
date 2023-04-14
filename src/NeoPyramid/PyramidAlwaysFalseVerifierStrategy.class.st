Class {
	#name : #PyramidAlwaysFalseVerifierStrategy,
	#superclass : #PyramidTargetVerifierStrategy,
	#category : #'NeoPyramid-plugin-commands'
}

{ #category : #testing }
PyramidAlwaysFalseVerifierStrategy >> isPrimitive [
^ true
]

{ #category : #'as yet unclassified' }
PyramidAlwaysFalseVerifierStrategy >> verify: anObject [

	^ false
]
