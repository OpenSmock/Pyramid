Class {
	#name : #PyramidSpaceBuilder,
	#superclass : #Object,
	#instVars : [
		'space',
		'presenter',
		'morph',
		'host',
		'rootElement'
	],
	#category : #'NeoPyramid-plugin-central'
}

{ #category : #initialization }
PyramidSpaceBuilder >> initialize [

	rootElement := BlElement new
		               clipChildren: false;
		               yourself.

	presenter := SpMorphPresenter new.

	morph := Morph new.
	morph layoutPolicy: TableLayout new.

	host := PyMorphicAlexandrieHost new.
	host containerMorph: morph.

	space := BlSpace new.
	space host: host.
	
	space addChild: rootElement.

	presenter morph: morph
]

{ #category : #accessing }
PyramidSpaceBuilder >> presenter [
	^ presenter
]

{ #category : #accessing }
PyramidSpaceBuilder >> rootElement [
^ rootElement
]

{ #category : #accessing }
PyramidSpaceBuilder >> space [

	^ space
]
