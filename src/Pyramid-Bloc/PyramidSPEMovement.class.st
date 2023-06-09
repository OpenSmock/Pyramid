Class {
	#name : #PyramidSPEMovement,
	#superclass : #PyramidSpacePluginExtension,
	#instVars : [
		'mutex',
		'catchEventOverlay',
		'elementTransformation',
		'transformationOverlay',
		'isDragging',
		'dragOrigin',
		'isShiftKeyPressed'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #wheel }
PyramidSPEMovement >> anyShiftPressed: anEvent do: aBlock [

	(anEvent key = KeyboardKey shiftRight or: [
		 anEvent key = KeyboardKey shiftLeft ]) ifTrue: [ aBlock value ]
]

{ #category : #accessing }
PyramidSPEMovement >> catchEventOverlay [

	^ catchEventOverlay
]

{ #category : #accessing }
PyramidSPEMovement >> currentTranslation [

	| matrix|
	matrix := self elementTransformation transformation matrix.
	^ matrix x @ matrix y.
	
]

{ #category : #'drag and drop' }
PyramidSPEMovement >> dragEvent: evt [

	mutex critical: [
		self isDragging ifFalse: [ ^ self ].
		evt middleButtonPressed ifFalse: [
			self isDragging: false.
			^ self ].
		self elementTransformation transformDo: [ :t |
		t translateBy: evt position - self dragOrigin ] ].
]

{ #category : #'drag and drop' }
PyramidSPEMovement >> dragOrigin [

	^ dragOrigin
]

{ #category : #'drag and drop' }
PyramidSPEMovement >> dragOrigin: anObject [

	dragOrigin := anObject
]

{ #category : #accessing }
PyramidSPEMovement >> elementTransformation [

	^ elementTransformation
]

{ #category : #initialization }
PyramidSPEMovement >> initialize [

	isShiftKeyPressed := false.
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
	elementEventCatcher
		when: BlMouseWheelEvent
		do: [ :evt | self wheelEvent: evt ].

	catchEventOverlay := PyramidOverlay new
		                     position: 20;
		                     element: elementEventCatcher;
		                     yourself
]

{ #category : #initialization }
PyramidSPEMovement >> initializeElementTransformation [

	elementTransformation := BlElement new
		                         id: #movement_transformation;
		clipChildren: false;
		                         constraintsDo: [ :c |
			                         c vertical matchParent.
			                         c horizontal matchParent ];
		                         transformDo: [ :t | t translateBy: 20 @ 40 ];
		                         yourself.
	transformationOverlay := PyramidOverlay new
		                         position: 100;
		                         element: elementTransformation;
		                         yourself
]

{ #category : #'as yet unclassified' }
PyramidSPEMovement >> installOnSpacePlugin: aSpacePlugin [

	| space |

	aSpacePlugin overlaysManager addOverlay: self catchEventOverlay.
	aSpacePlugin overlaysManager addOverlay: self transformationOverlay.
	
	space := aSpacePlugin overlaysManager space.
space when: BlKeyDownEvent do: [ :evt |
		self anyShiftPressed: evt do: [ self isShiftKeyPressed: true ] ].
	space when: BlKeyUpEvent do: [ :evt |
		self anyShiftPressed: evt do: [ self isShiftKeyPressed: false ] ].
]

{ #category : #'drag and drop' }
PyramidSPEMovement >> isDragging [

^ isDragging
]

{ #category : #'drag and drop' }
PyramidSPEMovement >> isDragging: aBoolean [

	isDragging := aBoolean
]

{ #category : #wheel }
PyramidSPEMovement >> isShiftKeyPressed [

	^ isShiftKeyPressed
]

{ #category : #wheel }
PyramidSPEMovement >> isShiftKeyPressed: aBoolean [

	isShiftKeyPressed := aBoolean
]

{ #category : #wheel }
PyramidSPEMovement >> keyBoardEvent: anEvent [

	| vector |
	vector := self isShiftKeyPressed
		          ifTrue: [
		          anEvent vector asPoint leftRotated * self wheelSpeed ]
		          ifFalse: [ anEvent vector asPoint * self wheelSpeed ].

	self elementTransformation transformDo: [ :t |
		t translateBy: vector + self currentTranslation ]
]

{ #category : #'drag and drop' }
PyramidSPEMovement >> startDragEvent: evt [

	self isDragging ifTrue: [ ^ self ].
	self isDragging: true.
	self dragOrigin: evt position - self currentTranslation
]

{ #category : #accessing }
PyramidSPEMovement >> transformationOverlay [

^ transformationOverlay
]

{ #category : #wheel }
PyramidSPEMovement >> wheelEvent: anEvent [

	| vector |
	vector := self isShiftKeyPressed
		          ifTrue: [
		          anEvent vector asPoint leftRotated * self wheelSpeed ]
		          ifFalse: [ anEvent vector asPoint * self wheelSpeed ].

	self elementTransformation transformDo: [ :t | t translateBy: vector + self currentTranslation ]
]

{ #category : #wheel }
PyramidSPEMovement >> wheelSpeed [

	^ 10
]
