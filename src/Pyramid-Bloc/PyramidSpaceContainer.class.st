Class {
	#name : #PyramidSpaceContainer,
	#superclass : #Object,
	#instVars : [
		'element'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #'as yet unclassified' }
PyramidSpaceContainer >> buildOn: aBlElement [

	self element parent ifNotNil: [ :p | p removeChild: self element ].
	aBlElement addChild: self element
]

{ #category : #accessing }
PyramidSpaceContainer >> element [

	^ element
]

{ #category : #accessing }
PyramidSpaceContainer >> element: anObject [

	element := anObject
]

{ #category : #initialization }
PyramidSpaceContainer >> initialize [

	element := BlElement new constraintsDo: [ :c | c vertical matchParent . c horizontal matchParent ]; clipChildren: false; yourself
]
