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

	| elements bounds formElement extent bound possibleSizes |
	elements := self asArray.
	bounds := elements collect: [ :each | each boundsInLocal ].

	formElement := BlElement new
		               clipChildren: false;
		               extent: 800 @ 600;
		               addChildren: self asArray;
		               background: Color white;
		               yourself.
	formElement forceLayout.
	extent := (formElement localBoundsToParent:
		           (BlBounds fromRectangle: formElement invalidationBounds))
		          extent.
	bound := BlBounds
		         left: 0
		         top: 0
		         right: 0
		         bottom: 0.
	formElement childrenDo: [ :each |
		bound merge: (each localBoundsToParent:
				 (BlBounds fromRectangle: each invalidationBounds)) ].
	extent := bound extent.
	possibleSizes := {
		                 (50 @ 50).
		                 (240 @ 240).
		                 (480 @ 480) } select: [ :each | each >= extent ].
	possibleSizes ifNotEmpty: [ formElement extent: possibleSizes first ].

	^ formElement exportAsForm
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
