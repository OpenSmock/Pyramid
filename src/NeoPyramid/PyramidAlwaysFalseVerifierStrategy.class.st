Class {
	#name : #PyramidAlwaysFalseVerifierStrategy,
	#superclass : #Object,
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
