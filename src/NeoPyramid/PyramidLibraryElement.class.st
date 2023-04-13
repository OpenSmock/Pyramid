Class {
	#name : #PyramidLibraryElement,
	#superclass : #Object,
	#instVars : [
		'title',
		'form',
		'blockMaker'
	],
	#category : #'NeoPyramid-plugin-adders'
}

{ #category : #accessing }
PyramidLibraryElement >> blockMaker [

	^ blockMaker
]

{ #category : #accessing }
PyramidLibraryElement >> blockMaker: anObject [

	blockMaker := anObject.
	form := blockMaker value aeAsForm
]

{ #category : #accessing }
PyramidLibraryElement >> form [

	^ form
]

{ #category : #accessing }
PyramidLibraryElement >> form: anObject [

	form := anObject
]

{ #category : #accessing }
PyramidLibraryElement >> title [

	^ title
]

{ #category : #accessing }
PyramidLibraryElement >> title: anObject [

	title := anObject
]
