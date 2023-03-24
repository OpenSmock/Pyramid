Class {
	#name : #PySpaceWithControlPresenter,
	#superclass : #PySpacePresenter,
	#instVars : [
		'controlLayer',
		'rootLayer',
		'callbackZoomIncrease',
		'callbackZoomDecrease',
		'callbackDragged'
	],
	#category : #'Pyramid-ZZZ-Deprecated-Editor-Views-Space'
}

{ #category : #initialization }
PySpaceWithControlPresenter >> initializeEventRelocate [

	controlLayer addEventFilter:
		(PyEventFilterMouseDrag new client: self rootLayer)
]

{ #category : #initialization }
PySpaceWithControlPresenter >> initializeEventSelection [

	controlLayer addEventFilter: PyEventFilterSelection new
]

{ #category : #initialization }
PySpaceWithControlPresenter >> initializeEventZoom [

	controlLayer
		when: BlMouseWheelEvent
		do: [ :evt | self whenScrollEventDo: evt ]
]

{ #category : #initialization }
PySpaceWithControlPresenter >> initializeLayers [

	rootLayer := BlElement new id: #editorRootLayer.
	rootLayer preventChildrenMouseEvents.

	controlLayer := BlElement new
		                id: #editorControlLayer;
		                size: 15000 @ 15000;
		                yourself.

	controlLayer addChild: rootLayer.
	space addChild: controlLayer.

	self initializeEventRelocate.
	self initializeEventSelection.
	self initializeEventZoom.
	self initializeMenu.
]

{ #category : #initialization }
PySpaceWithControlPresenter >> initializeMenu [

	viewPresenter contextMenu: (SpMenuPresenter new addGroup: [ :group |
					   group addItem: [ :item | item name: 'Testing' ] ])
]

{ #category : #'as yet unclassified' }
PySpaceWithControlPresenter >> methodSelectorAndArgumentNames [

	self contextMenu: (SpMenuPresenter new addGroup: [ :group |
					   group addItem: [ :item |
							   item
								   name: 'Browse method class';
								   action: [ self methodClass browse ] ] ])
]

{ #category : #'as yet unclassified' }
PySpaceWithControlPresenter >> relocateOrigin [

	self rootLayer relocate: 0 asPoint.
]

{ #category : #initialization }
PySpaceWithControlPresenter >> rootLayer [

	^ rootLayer
]

{ #category : #initialization }
PySpaceWithControlPresenter >> scaleBy: aRatio [

	rootLayer transform
		scaleBy: aRatio;
		apply
]

{ #category : #initialization }
PySpaceWithControlPresenter >> whenScrollEventDo: anEvent [

	anEvent isScrollUp ifTrue: [ callbackZoomIncrease value ].
	anEvent isScrollDown ifTrue: [ callbackZoomDecrease value ]
]

{ #category : #initialization }
PySpaceWithControlPresenter >> whenZoomDecrease: aFullBlockClosure [

	callbackZoomDecrease := aFullBlockClosure
]

{ #category : #initialization }
PySpaceWithControlPresenter >> whenZoomIncrease: aFullBlockClosure [

	callbackZoomIncrease := aFullBlockClosure
]
