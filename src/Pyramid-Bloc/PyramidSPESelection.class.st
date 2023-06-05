Class {
	#name : #PyramidSPESelection,
	#superclass : #PyramidSpacePluginExtension,
	#instVars : [
		'mutex',
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
PyramidSPESelection >> accumulateChildrenOf: aBlElement in: aCollection [

	aCollection add: aBlElement.
	aBlElement childrenDo: [ :each |
		self accumulateChildrenOf: each in: aCollection ].
]

{ #category : #'as yet unclassified' }
PyramidSPESelection >> activeProject [

	^ activeProject
]

{ #category : #'as yet unclassified' }
PyramidSPESelection >> activeProject: anObject [
	activeProject:= anObject
]

{ #category : #'as yet unclassified' }
PyramidSPESelection >> allElementsInGraph [

	| ret |
	ret := OrderedCollection new.
	self rootElement childrenDo: [ :each | self accumulateChildrenOf: each in: ret. ].
	^ ret
]

{ #category : #accessing }
PyramidSPESelection >> canvasElement [

	^ canvasElement
]

{ #category : #accessing }
PyramidSPESelection >> catchEventOverlay [

	^ catchEventOverlay
]

{ #category : #'as yet unclassified' }
PyramidSPESelection >> connectOn: aPyramidEditor [

	self activeProject: aPyramidEditor activeProject
]

{ #category : #initialization }
PyramidSPESelection >> defaultSelectionElement [

	^ BlElement new
		  background: Color blue muchLighter translucent;
		  border: (BlBorder paint: Color blue translucent width: 2);
		  size: 1 @ 1;
		  yourself
]

{ #category : #'drag and drop' }
PyramidSPESelection >> dragEvent: evt [

	| xmin ymin |
	mutex critical: [
		self isDragging ifFalse: [ ^ self ].
		evt primaryButtonPressed ifFalse: [
			self endDragEvent: evt.
			^ self ].
		self selectionElement size: (evt position - self dragOrigin) abs.
		xmin := self dragOrigin x min: evt position x.
		ymin := self dragOrigin y min: evt position y.
		self selectionElement position: xmin @ ymin ]
]

{ #category : #'drag and drop' }
PyramidSPESelection >> dragOrigin [

	^ dragOrigin
]

{ #category : #'drag and drop' }
PyramidSPESelection >> dragOrigin: anObject [

	dragOrigin := anObject
]

{ #category : #'drag and drop' }
PyramidSPESelection >> endDragEvent: evt [

	self isDragging: false.
	self selectElementsInBounds: self selectionElement boundsInSpace.
	self selectionElement
		size: 1 @ 1;
		position: -10 @ -10.
	canvasElement removeChild: self selectionElement
]

{ #category : #initialization }
PyramidSPESelection >> initialize [

	isDragging := false.
	mutex := Mutex new.
	selectionElement := self defaultSelectionElement.
	self initializeElementEventCatcher
]

{ #category : #initialization }
PyramidSPESelection >> initializeElementEventCatcher [

	canvasElement := BlElement new
		                 id: #selection_canvas;
		                 constraintsDo: [ :c |
			                 c vertical matchParent.
			                 c horizontal matchParent ];
		                 yourself.

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
PyramidSPESelection >> installOnSpacePlugin: aSpacePlugin [

	aSpacePlugin overlaysManager addOverlay: self catchEventOverlay.
	self rootElement: aSpacePlugin overlaysManager rootElement
]

{ #category : #'drag and drop' }
PyramidSPESelection >> isDragging [

^ isDragging
]

{ #category : #'drag and drop' }
PyramidSPESelection >> isDragging: aBoolean [

	isDragging := aBoolean
]

{ #category : #accessing }
PyramidSPESelection >> rootElement [

	^ rootElement
]

{ #category : #accessing }
PyramidSPESelection >> rootElement: anObject [

	rootElement := anObject
]

{ #category : #'as yet unclassified' }
PyramidSPESelection >> selectElementsInBounds: aBound [

	| selectedElements |
	selectedElements := self allElementsInGraph select: [ :each |
		                    aBound intersects: each boundsInSpace ].
	(self activeProject selection isEmpty and: [
		 selectedElements isEmpty ]) ifTrue: [ ^ self ].
	(self activeProject selection size = selectedElements size and: [
		 self activeProject selection elements allSatisfy: [ :a |
			 selectedElements anySatisfy: [ :b | b = a ] ] ]) ifTrue: [ ^ self ].
	self activeProject selection replaceAll: selectedElements
]

{ #category : #accessing }
PyramidSPESelection >> selectionElement [

	^ selectionElement
]

{ #category : #'drag and drop' }
PyramidSPESelection >> startDragEvent: evt [

	self isDragging ifTrue: [ ^ self ].
	self isDragging: true.
	self dragOrigin: evt position.
	self canvasElement addChild: self selectionElement
]
