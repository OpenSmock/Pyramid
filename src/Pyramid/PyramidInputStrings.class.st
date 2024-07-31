Class {
	#name : #PyramidInputStrings,
	#superclass : #Object,
	#instVars : [
		'help'
	],
	#category : 'Pyramid-specs-custom'
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
