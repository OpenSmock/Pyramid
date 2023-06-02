Class {
	#name : #PyramidOverlaysManager,
	#superclass : #Object,
	#traits : 'TPyramidOverlayObserver',
	#classTraits : 'TPyramidOverlayObserver classTrait',
	#instVars : [
		'overlays',
		'space',
		'spaceElement',
		'rootElement'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #adding }
PyramidOverlaysManager >> addOverlay: anOverlay [

	anOverlay addObserver: self.
	self overlays add: anOverlay.
	self overlays: self overlays sorted.
	self computeOverlays
]

{ #category : #adding }
PyramidOverlaysManager >> computeOverlays [
	self computeOverlaysFor: (self overlays select: [ :o | o isVisible ])
]

{ #category : #'as yet unclassified' }
PyramidOverlaysManager >> computeOverlaysFor: aCollection [

	| current |
	current := self rootElement.
	self rootElement allParentsDo: [ :parent |
		parent removeChild: current.
		current := parent ].
	current := self spaceElement.
	aCollection do: [ :each |
		current addChild: each element.
		current := each element ].
	current addChild: self rootElement
]

{ #category : #initialization }
PyramidOverlaysManager >> initialize [

	overlays := OrderedCollection new.
	space := BlSpace new.
	spaceElement := space root.
	rootElement := BlElement new constraintsDo: [ :c |
		               c horizontal matchParent.
		               c vertical matchParent ].
	spaceElement addChild: rootElement.


]

{ #category : #accessing }
PyramidOverlaysManager >> overlays [

	^ overlays
]

{ #category : #accessing }
PyramidOverlaysManager >> overlays: aCollection [

	 overlays := aCollection
]

{ #category : #'as yet unclassified' }
PyramidOverlaysManager >> pyramidVisibilityChanged [

	self computeOverlays
]

{ #category : #accessing }
PyramidOverlaysManager >> rootElement [

	^ rootElement
]

{ #category : #accessing }
PyramidOverlaysManager >> spaceElement [
^ spaceElement
]
