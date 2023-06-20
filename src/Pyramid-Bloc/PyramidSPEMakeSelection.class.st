Class {
	#name : #PyramidSPEMakeSelection,
	#superclass : #PyramidSpacePluginExtension,
	#instVars : [
		'catchEventOverlay',
		'isDragging',
		'dragOrigin',
		'canvasElement',
		'selectionElement',
		'rootElement',
		'activeProject'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #'as yet unclassified' }
PyramidSPEMakeSelection >> activeProject [

	^ activeProject
]

{ #category : #'as yet unclassified' }
PyramidSPEMakeSelection >> activeProject: anObject [
	activeProject:= anObject
]

{ #category : #'as yet unclassified' }
PyramidSPEMakeSelection >> allElementsInGraph [

	^ PyramidTreeToFlat flattenChildrenOfCollection: self rootElement children.
	
]

{ #category : #accessing }
PyramidSPEMakeSelection >> canvasElement [

	^ canvasElement
]

{ #category : #accessing }
PyramidSPEMakeSelection >> catchEventOverlay [

	^ catchEventOverlay
]

{ #category : #'as yet unclassified' }
PyramidSPEMakeSelection >> connectOn: aPyramidEditor [

	self activeProject: aPyramidEditor activeProject
]

{ #category : #initialization }
PyramidSPEMakeSelection >> defaultSelectionElement [

	^ BlElement new
		  background: Color blue muchLighter translucent;
		  border: (BlBorder paint: Color blue translucent width: 2);
		  size: 1 @ 1;
		  yourself
]

{ #category : #'mouse handlers' }
PyramidSPEMakeSelection >> doubleClickEvent: event [

	| selectedElements |
	selectedElements := self allElementsInGraph select: [ :each |
		                    each boundsInSpace containsPoint: event position ].
	"We only keep the last one since it should always be the last to be drawn."
	selectedElements ifEmpty: [ ^ self ].
	self activeProject selection replaceAll: { selectedElements last }
]

{ #category : #'drag and drop' }
PyramidSPEMakeSelection >> dragEvent: evt [

	| xmin ymin |
		self isDragging ifFalse: [ ^ self ].
		evt primaryButtonPressed ifFalse: [
			self endDragEvent: evt.
			^ self ].
		self selectionElement size: (evt position - self dragOrigin) abs.
		xmin := self dragOrigin x min: evt position x.
		ymin := self dragOrigin y min: evt position y.
		self selectionElement position: xmin @ ymin
]

{ #category : #'drag and drop' }
PyramidSPEMakeSelection >> dragOrigin [

	^ dragOrigin
]

{ #category : #'drag and drop' }
PyramidSPEMakeSelection >> dragOrigin: anObject [

	dragOrigin := anObject
]

{ #category : #'drag and drop' }
PyramidSPEMakeSelection >> endDragEvent: evt [

	self isDragging: false.
	self selectElementsInBounds: self selectionElement boundsInSpace.
	self selectionElement
		size: 1 @ 1;
		position: -10 @ -10.
	canvasElement removeChild: self selectionElement
]

{ #category : #initialization }
PyramidSPEMakeSelection >> initialize [

	isDragging := false.
	selectionElement := self defaultSelectionElement.
	self initializeElementEventCatcher.
]

{ #category : #initialization }
PyramidSPEMakeSelection >> initializeElementEventCatcher [

	canvasElement := BlElement new
		                 id: #selection_canvas;
		                 constraintsDo: [ :c |
			                 c vertical matchParent.
			                 c horizontal matchParent ];
		                 yourself.

	canvasElement
		when: BlDoubleClickEvent
		do: [ :evt | self doubleClickEvent: evt ].
	canvasElement
		when: BlMouseDownEvent
		do: [ :evt | self startDragEvent: evt ].
	canvasElement
		when: BlMouseDownEvent
		do: [ :evt | self startDragEvent: evt ].
	canvasElement
		when: BlMouseMoveEvent
		do: [ :evt | self dragEvent: evt ].
	canvasElement
		when: BlMouseUpEvent
		do: [ :evt |
		evt primaryButtonPressed ifTrue: [ self endDragEvent: evt ] ].

	catchEventOverlay := PyramidOverlay new
		                     position: 25;
		                     element: canvasElement;
		                     yourself
]

{ #category : #'as yet unclassified' }
PyramidSPEMakeSelection >> installOnSpacePlugin: aSpacePlugin [

	aSpacePlugin overlaysManager addOverlay: self catchEventOverlay.
	self rootElement: aSpacePlugin overlaysManager rootElement
]

{ #category : #'drag and drop' }
PyramidSPEMakeSelection >> isDragging [

^ isDragging
]

{ #category : #'drag and drop' }
PyramidSPEMakeSelection >> isDragging: aBoolean [

	isDragging := aBoolean
]

{ #category : #accessing }
PyramidSPEMakeSelection >> rootElement [

	^ rootElement
]

{ #category : #accessing }
PyramidSPEMakeSelection >> rootElement: anObject [

	rootElement := anObject
]

{ #category : #'as yet unclassified' }
PyramidSPEMakeSelection >> selectElementsInBounds: aBound [

	| selectedElements |
	selectedElements := self allElementsInGraph select: [ :each |
		                    aBound containsRect: each boundsInSpace ].
	(self activeProject selection isEmpty and: [
		 selectedElements isEmpty ]) ifTrue: [ ^ self ].
	(self activeProject selection size = selectedElements size and: [
		 self activeProject selection allSatisfy: [ :a |
			 selectedElements anySatisfy: [ :b | b = a ] ] ]) ifTrue: [ ^ self ].
	self activeProject selection replaceAll: selectedElements
]

{ #category : #accessing }
PyramidSPEMakeSelection >> selectionElement [

	^ selectionElement
]

{ #category : #'drag and drop' }
PyramidSPEMakeSelection >> startDragEvent: evt [

	self isDragging ifTrue: [ ^ self ].
	evt primaryButtonPressed ifFalse: [ ^ self ].
	self isDragging: true.
	self dragOrigin: evt position.
	self canvasElement addChild: self selectionElement
]
