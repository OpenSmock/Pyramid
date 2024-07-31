Class {
	#name : #PyramidLibraryCategory,
	#superclass : #Object,
	#instVars : [
		'elements',
		'name',
		'icon'
	],
	#category : #'Pyramid-Bloc-plugin-navigation'
}

{ #category : #accessing }
PyramidLibraryCategory >> elements [

	^ elements
]

{ #category : #accessing }
PyramidLibraryCategory >> elements: anObject [

	elements := anObject
]

{ #category : #accessing }
PyramidLibraryCategory >> icon [

	^ icon
]

{ #category : #accessing }
PyramidLibraryCategory >> icon: anObject [

	icon := anObject
]

{ #category : #initialization }
PyramidLibraryCategory >> initialize [

	elements := {  }
]

{ #category : #accessing }
PyramidLibraryCategory >> name [

	^ name
]

{ #category : #accessing }
PyramidLibraryCategory >> name: anObject [

	name := anObject
]
