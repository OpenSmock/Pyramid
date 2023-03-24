Class {
	#name : #PyEventFilterMouseDrag,
	#superclass : #BlEventListener,
	#instVars : [
		'client',
		'startPosition',
		'offset',
		'dragEnable'
	],
	#category : #'Pyramid-ZZZ-Deprecated-Editor-Views-Space'
}

{ #category : #'api - hooks' }
PyEventFilterMouseDrag >> client: anObject [

	client := anObject
]

{ #category : #'as yet unclassified' }
PyEventFilterMouseDrag >> disableDrag [

	dragEnable := false.
]

{ #category : #'as yet unclassified' }
PyEventFilterMouseDrag >> enableDrag [

	dragEnable := true
]

{ #category : #initialization }
PyEventFilterMouseDrag >> initialize [

	dragEnable := false.
	offset := 0 asPoint
]

{ #category : #testing }
PyEventFilterMouseDrag >> isDragEnable [

	^ dragEnable
]

{ #category : #'mouse handlers' }
PyEventFilterMouseDrag >> mouseDownEvent: anEvent [

	anEvent button = BlMouseMiddleButton uniqueInstance ifTrue: [ 
		anEvent consumed: true.
		self enableDrag.
		anEvent source currentCursor: BlCursor crosshair.
		offset := client position.
		startPosition := anEvent position ]
]

{ #category : #'mouse handlers' }
PyEventFilterMouseDrag >> mouseMoveEvent: anEvent [

	| newPosition |
	self isDragEnable ifFalse: [ ^ self ].
	anEvent button ifNil: [ ^ self ].
	anEvent button = BlMouseMiddleButton uniqueInstance ifFalse: [ 
		^ self ]. 
		
		anEvent consumed: true.
		newPosition := anEvent position + offset - startPosition.
		client relocate: newPosition
]

{ #category : #'mouse handlers' }
PyEventFilterMouseDrag >> mouseOutEvent: anEvent [
]

{ #category : #'mouse handlers' }
PyEventFilterMouseDrag >> mouseUpEvent: anEvent [

	anEvent button = BlMouseMiddleButton uniqueInstance ifTrue: [ 
		anEvent consumed: true.
		anEvent source: BlCursor default.
		self disableDrag ]
]
