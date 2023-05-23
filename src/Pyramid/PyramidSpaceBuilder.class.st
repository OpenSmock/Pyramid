Class {
	#name : #PyramidSpaceBuilder,
	#superclass : #Object,
	#instVars : [
		'space',
		'presenter',
		'morph',
		'host',
		'layers',
		'canvas'
	],
	#category : #'Pyramid-plugin-central'
}

{ #category : #adding }
PyramidSpaceBuilder >> addLayer: aLayer [
	"
	add Layer to layers.
	add Layer root to parent of rootElement.
	remove rootElement of parent of rootElement.
	add rootElement to Layer canvas.
	"

	aLayer configureSpaceBuilder: self.
	self layers add: aLayer.
	self canvas parent addChild: aLayer root.
	self canvas parent removeChild: self canvas.
	aLayer canvas addChild: self canvas
]

{ #category : #accessing }
PyramidSpaceBuilder >> canvas [

	^ canvas
]

{ #category : #initialization }
PyramidSpaceBuilder >> initialize [

	canvas := BlElement new
		          clipChildren: false;
		          constraintsDo: [ :c |
			          c horizontal matchParent.
			          c vertical matchParent ];
		          yourself.

	presenter := SpMorphPresenter new.

	morph := Morph new.
	morph layoutPolicy: TableLayout new.

	host := PyramidMorphicAlexandrieHost new.
	host containerMorph: morph.

	space := BlSpace new.
	space host: host.
	space root background: self spaceBackground.

	space addChild: canvas.

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
PyramidSpaceBuilder >> space [

	^ space
]

{ #category : #opening }
PyramidSpaceBuilder >> spaceBackground [
	^ Color gray
]
