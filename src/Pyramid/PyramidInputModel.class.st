Class {
	#name : #PyramidInputModel,
	#superclass : #Object,
	#instVars : [
		'help'
	],
	#category : #'Pyramid-specs-custom'
}

{ #category : #accessing }
PyramidInputModel >> help [

	^ help
]

{ #category : #accessing }
PyramidInputModel >> help: anObject [

	help := anObject
]

{ #category : #initialization }
PyramidInputModel >> initialize [

	help := ''
]
