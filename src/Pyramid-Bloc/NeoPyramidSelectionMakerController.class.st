Class {
	#name : #NeoPyramidSelectionMakerController,
	#superclass : #Object,
	#classTraits : 'TPyramidProjectModelObserver classTrait',
	#instVars : [
		'activeProject',
		'overlay',
		'dragOrigin',
		'isDragging',
		'elementPreview'
	],
	#category : #'Pyramid-Bloc-plugin-overlays'
}

{ #category : #accessing }
NeoPyramidSelectionMakerController >> activeProject [

	^ activeProject
]

{ #category : #accessing }
NeoPyramidSelectionMakerController >> activeProject: anObject [

	activeProject := anObject.
]

{ #category : #adding }
NeoPyramidSelectionMakerController >> addEventsTo: aBlElement [


	aBlElement when: BlDoubleClickEvent do: [ :evt | self doubleClickEvent: evt ].
	aBlElement when: BlMouseDownEvent do: [ :evt |
		evt primaryButtonPressed ifTrue: [
			self isDragging: true.
			self dragOrigin: evt position.
			self startDragEvent ] ].
	aBlElement
		when: BlMouseMoveEvent
		do: [ :evt |
		self isDragging ifTrue: [ self dragEvent: evt position ] ].
	aBlElement when: BlMouseUpEvent do: [ :evt |
		evt primaryButtonPressed ifTrue: [
			self isDragging: false.
			self endDragEvent ] ]
]

{ #category : #'as yet unclassified' }
NeoPyramidSelectionMakerController >> computeNewSelectionInBounds: aBound [

	| allElements selectedElements |
	self activeProject ifNil: [ ^ self ].
	allElements := PyramidTreeToFlat flattenChildrenOfCollection:
		               self activeProject roots.

	selectedElements := allElements select: [ :each |
		                    aBound containsRect: each boundsInSpace ].

	self activeProject selection = selectedElements ifTrue: [ ^ self ].
	self activeProject selection replaceAll: selectedElements
]

{ #category : #'as yet unclassified' }
NeoPyramidSelectionMakerController >> doubleClickEvent: anEvent [

	| allElements selectedElements last |
	self activeProject ifNil: [ ^ self ].
	allElements := PyramidTreeToFlat flattenChildrenOfCollection:
		               self activeProject roots.

	selectedElements := allElements select: [ :each |
		                    each boundsInSpace containsPoint: anEvent position ].
	selectedElements ifEmpty: [ ^ self ].
	last := selectedElements last.
	self activeProject selection replaceAll: { last }
]

{ #category : #'as yet unclassified' }
NeoPyramidSelectionMakerController >> dragEvent: aPosition [

	| xmin ymin |
	xmin := self dragOrigin x min: aPosition x.
	ymin := self dragOrigin y min: aPosition y.
	self elementPreview position: xmin @ ymin; size: (aPosition - self dragOrigin) abs.
]

{ #category : #accessing }
NeoPyramidSelectionMakerController >> dragOrigin [

	^ dragOrigin
]

{ #category : #accessing }
NeoPyramidSelectionMakerController >> dragOrigin: anObject [

	dragOrigin := anObject
]

{ #category : #accessing }
NeoPyramidSelectionMakerController >> elementPreview [

	^ elementPreview
]

{ #category : #'as yet unclassified' }
NeoPyramidSelectionMakerController >> endDragEvent [

	self elementPreview
		visibility: BlVisibility gone.
	self computeNewSelectionInBounds: self elementPreview boundsInSpace.
]

{ #category : #initialization }
NeoPyramidSelectionMakerController >> initialize [

	dragOrigin := 0 @ 0.
	isDragging := false.
	elementPreview := BlElement new
		                  visibility: BlVisibility gone;
		                  background: Color blue translucent;
		zIndex: 200;
		                  yourself
]

{ #category : #accessing }
NeoPyramidSelectionMakerController >> isDragging [

	^ isDragging
]

{ #category : #accessing }
NeoPyramidSelectionMakerController >> isDragging: anObject [

	isDragging := anObject
]

{ #category : #accessing }
NeoPyramidSelectionMakerController >> overlay [

	^ overlay
]

{ #category : #accessing }
NeoPyramidSelectionMakerController >> overlay: anObject [

	overlay := anObject.
	anObject overlayElement addChild: self elementPreview.
	self addEventsTo: anObject overlayElement.
]

{ #category : #'as yet unclassified' }
NeoPyramidSelectionMakerController >> startDragEvent [

	self elementPreview
		position: self dragOrigin;
		size: 0 @ 0;
		visibility: BlVisibility visible
]
