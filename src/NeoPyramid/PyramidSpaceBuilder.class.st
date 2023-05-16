Class {
	#name : #PyramidSpaceBuilder,
	#superclass : #Object,
	#instVars : [
		'space',
		'presenter',
		'morph',
		'host',
		'rootElement',
		'layers'
	],
	#category : #'NeoPyramid-plugin-central'
}

{ #category : #adding }
PyramidSpaceBuilder >> addLayer: aLayer [
	"
	add Layer to layers.
	add Layer root to parent of rootElement.
	remove rootElement of parent of rootElement.
	add rootElement to Layer canvas.
	"

	aLayer builder: self.
	self layers add: aLayer.
	self rootElement parent addChild: aLayer root.
	self rootElement parent removeChild: self rootElement.
	aLayer canvas addChild: self rootElement
]

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
	space root background: self spaceBackground.

	space addChild: rootElement.

	presenter morph: morph
]

{ #category : #accessing }
PyramidSpaceBuilder >> layers [
layers ifNil: [ layers := OrderedCollection new ].
	^ layers.
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

{ #category : #opening }
PyramidSpaceBuilder >> spaceBackground [
	^ Color gray
]
