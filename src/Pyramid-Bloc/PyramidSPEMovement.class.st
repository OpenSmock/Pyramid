Class {
	#name : #PyramidSPEMovement,
	#superclass : #PyramidSpacePluginExtension,
	#instVars : [
		'mutex',
		'catchEventOverlay',
		'elementTransformation',
		'transformationOverlay',
		'isDragging',
		'dragOrigin'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #accessing }
PyramidSPEMovement >> catchEventOverlay [

	^ catchEventOverlay
]

{ #category : #initialization }
PyramidSPEMovement >> dragEvent: evt [

mutex critical: [
		self isDragging ifFalse: [ ^ self ].
		evt middleButtonPressed ifFalse: [
			self isDragging: false.
			^ self ].
		self elementTransformation transformDo: [ :t |
			t translateBy: evt position - self dragOrigin ] ]
]

{ #category : #initialization }
PyramidSPEMovement >> dragOrigin [

	^ dragOrigin
]

{ #category : #initialization }
PyramidSPEMovement >> dragOrigin: anObject [

	dragOrigin := anObject
]

{ #category : #accessing }
PyramidSPEMovement >> elementTransformation [

	^ elementTransformation
]

{ #category : #initialization }
PyramidSPEMovement >> initialize [

	isDragging := false.
	mutex := Mutex new.
	self initializeElementTransformation.
	self initializeElementEventCatcher
]

{ #category : #initialization }
PyramidSPEMovement >> initializeElementEventCatcher [

	| elementEventCatcher |
	elementEventCatcher := BlElement new
		                       id: #movement_catch;
		                       constraintsDo: [ :c |
			                       c vertical matchParent.
			                       c horizontal matchParent ];
		                       yourself.

	elementEventCatcher
		when: BlMouseDownEvent
		do: [ :evt | self startDragEvent: evt ].
	elementEventCatcher
		when: BlMouseMoveEvent
		do: [ :evt | self dragEvent: evt ].

	catchEventOverlay := PyramidOverlay new
		                     position: 20;
		                     element: elementEventCatcher;
		                     yourself
]

{ #category : #initialization }
PyramidSPEMovement >> initializeElementTransformation [

	elementTransformation := BlElement new
		                         id: #movement_transformation;
		                         constraintsDo: [ :c |
			                  c vertical matchParent.
			                  c horizontal matchParent ];
		                         yourself.
	transformationOverlay := PyramidOverlay new
		                         position: 100;
		                         element: elementTransformation;
		                         yourself
]

{ #category : #'as yet unclassified' }
PyramidSPEMovement >> installOnSpacePlugin: aSpacePlugin [

	aSpacePlugin overlaysManager addOverlay: self catchEventOverlay.
	aSpacePlugin overlaysManager addOverlay: self transformationOverlay
]

{ #category : #accessing }
PyramidSPEMovement >> isDragging [

^ isDragging
]

{ #category : #accessing }
PyramidSPEMovement >> isDragging: aBoolean [

	isDragging := aBoolean
]

{ #category : #initialization }
PyramidSPEMovement >> startDragEvent: evt [

	| matrix translation |
	self isDragging ifTrue: [ ^ self ].
	self isDragging: true.

	matrix := self elementTransformation transformation matrix.
	translation := matrix x @ matrix y.
	self dragOrigin: evt position - translation
]

{ #category : #accessing }
PyramidSPEMovement >> transformationOverlay [

^ transformationOverlay
]
