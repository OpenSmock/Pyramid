Class {
	#name : #PyramidLibraryElement,
	#superclass : #Object,
	#instVars : [
		'name',
		'icon',
		'block'
	],
	#category : #'Pyramid-Bloc-plugin-navigation'
}

{ #category : #converting }
PyramidLibraryElement >> asArray [

	^ self block value
]

{ #category : #converting }
PyramidLibraryElement >> asForm [

	^ BlElement new clipChildren: false; size: 800 @ 600; addChildren: (self asArray); exportAsForm
]

{ #category : #accessing }
PyramidLibraryElement >> block [

	^ block
]

{ #category : #accessing }
PyramidLibraryElement >> block: anObject [

	block := anObject
]

{ #category : #accessing }
PyramidLibraryElement >> icon [

	^ icon
]

{ #category : #accessing }
PyramidLibraryElement >> icon: anObject [

	icon := anObject
]

{ #category : #accessing }
PyramidLibraryElement >> name [

	^ name
]

{ #category : #accessing }
PyramidLibraryElement >> name: anObject [

	name := anObject
]
