Class {
	#name : #PyramidCommandState,
	#superclass : #Object,
	#instVars : [
		'arguments',
		'source'
	],
	#category : #'Pyramid-commands'
}

{ #category : #comparing }
PyramidCommandState >> = anObject [

	self class = anObject class ifFalse: [ ^ false ].
	^ self source = anObject source and: [
		  self arguments = anObject arguments ]
]

{ #category : #accessing }
PyramidCommandState >> arguments [

	^ arguments
]

{ #category : #accessing }
PyramidCommandState >> arguments: anObject [

	arguments := anObject
]

{ #category : #accessing }
PyramidCommandState >> source [

	^ source
]

{ #category : #accessing }
PyramidCommandState >> source: anObject [
	source:=  anObject
]
