Class {
	#name : #PyramidLibraryElement,
	#superclass : #Object,
	#instVars : [
		'title',
		'form',
		'blockMaker'
	],
	#category : #'Pyramid-Bloc-plugin-library'
}

{ #category : #converting }
PyramidLibraryElement >> asElement [

	^ self blockMaker value
]

{ #category : #accessing }
PyramidLibraryElement >> blockMaker [

	^ blockMaker
]

{ #category : #accessing }
PyramidLibraryElement >> blockMaker: anObject [

	blockMaker := anObject.
	form := blockMaker value exportAsForm
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
