Class {
	#name : #PyEventFilterSelection,
	#superclass : #BlSelectionTool,
	#category : #'Pyramid-ZZZ-Deprecated-Editor-Views-Space'
}

{ #category : #'dnd handlers' }
PyEventFilterSelection >> dragStartEvent: anEvent [

	anEvent consumed: true.

	self resetCurrentSelections.
	startPosition := anEvent position.
	selectionRect
		size: 50 @ 50;
		relocate: startPosition.
	client addChild: selectionRect
]
