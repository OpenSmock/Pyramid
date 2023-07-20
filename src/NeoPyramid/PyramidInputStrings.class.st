Class {
	#name : #PyramidInputStrings,
	#superclass : #Object,
	#instVars : [
		'help'
	],
	#category : #'NeoPyramid-specs-custom'
}

{ #category : #accessing }
PyramidInputStrings >> help [

	^ help
]

{ #category : #accessing }
PyramidInputStrings >> help: anObject [

	help := anObject
]

{ #category : #initialization }
PyramidInputStrings >> initialize [

	help := ''
]
