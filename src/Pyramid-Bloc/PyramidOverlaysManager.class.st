Class {
	#name : #PyramidOverlaysManager,
	#superclass : #Object,
	#traits : 'TPyramidOverlayObserver + TPyramidActiveProjectModelObserver',
	#classTraits : 'TPyramidOverlayObserver classTrait + TPyramidActiveProjectModelObserver classTrait',
	#instVars : [
		'overlays',
		'space',
		'spaceElement',
		'rootElement',
		'activeProject'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #accessing }
PyramidOverlaysManager >> activeProject [
^ activeProject
]

{ #category : #accessing }
PyramidOverlaysManager >> activeProject: anObject [

	activeProject := anObject.
	anObject addObserver: self
]

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
	rootElement := BlElement new clipChildren: false; constraintsDo: [ :c |
		               c horizontal matchParent.
		               c vertical matchParent ];yourself.
	spaceElement addChild: rootElement
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
PyramidOverlaysManager >> pyramidRootsChangedOnActiveProject [

	self rootElement removeChildren.
	self rootElement addChildren: self activeProject roots elements
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
PyramidOverlaysManager >> space [

	^ space
]

{ #category : #accessing }
PyramidOverlaysManager >> spaceElement [
^ spaceElement
]
