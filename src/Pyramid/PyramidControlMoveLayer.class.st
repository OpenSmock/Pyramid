Class {
	#name : #PyramidControlMoveLayer,
	#superclass : #PyramidSpaceLayer,
	#instVars : [
		'isStarted',
		'startingPosition',
		'currentOffset',
		'isShiftKeyPressed'
	],
	#category : #'Pyramid-plugin-central'
}

{ #category : #'as yet unclassified' }
PyramidControlMoveLayer >> anyShiftPressed: anEvent do: aBlock [

(anEvent key = KeyboardKey shiftRight or: [ anEvent key = KeyboardKey shiftLeft ]) ifTrue: [ aBlock value ]
]

{ #category : #accessing }
PyramidControlMoveLayer >> configureSpaceBuilder: aPyramidSpaceBuilder [

	self space: aPyramidSpaceBuilder space
]

{ #category : #'as yet unclassified' }
PyramidControlMoveLayer >> currentOffset [
	^ currentOffset 
]

{ #category : #'as yet unclassified' }
PyramidControlMoveLayer >> currentOffset: anObject [

	currentOffset:=anObject
]

{ #category : #initialization }
PyramidControlMoveLayer >> initialize [
	"
	Click and drag:
	 - ??? désactiver les events de canvas et enfants de canvas. ???
	 - quand on click sur root, recupérer la position de départ.
	 - quand on on déplace la souris, on récupére position souris - position départ et on set la position du canvas.
	"

	isStarted := false.
	isShiftKeyPressed := false.
	currentOffset := 0 @ 0.

	self root
		when: BlMouseWheelEvent
		do: [ :evt | self mouseWheelEvent: evt ].
	self root
		when: BlMouseDownEvent
		do: [ :evt | self startDragEvent: evt ].
	self root when: BlMouseMoveEvent do: [ :evt | self moveEvent: evt ].
	self root when: BlMouseUpEvent do: [ :evt | self stopDragEvent: evt ]
]

{ #category : #'mouse handlers' }
PyramidControlMoveLayer >> isShiftKeyPressed [
^ isShiftKeyPressed
]

{ #category : #'mouse handlers' }
PyramidControlMoveLayer >> isShiftKeyPressed: aBoolean [

	isShiftKeyPressed := aBoolean
]

{ #category : #accessing }
PyramidControlMoveLayer >> isStarted [
^ isStarted
]

{ #category : #accessing }
PyramidControlMoveLayer >> isStarted: anObject [

	isStarted := anObject
]

{ #category : #'mouse handlers' }
PyramidControlMoveLayer >> mouseWheelEvent: anEvent [

	self isShiftKeyPressed
		ifTrue: [
			self canvas position:
				self canvas position + (anEvent vector asPoint leftRotated
				* self wheelSpeed) ]
		ifFalse: [
			self canvas position:
				self canvas position + (anEvent vector * self wheelSpeed) ]
]

{ #category : #'as yet unclassified' }
PyramidControlMoveLayer >> moveEvent: anEvent [

	self isStarted ifFalse: [ ^ self ].
	anEvent middleButtonPressed ifFalse: [
		self isStarted: false.
		^ self ].
	self canvas position: self currentOffset + anEvent position - self startingPosition
]

{ #category : #accessing }
PyramidControlMoveLayer >> space: aSpace [

	aSpace when: BlKeyDownEvent do: [ :evt |
		self anyShiftPressed: evt do: [ self isShiftKeyPressed: true ] ].
	aSpace when: BlKeyUpEvent do: [ :evt |
		self anyShiftPressed: evt do: [ self isShiftKeyPressed: false ] ].
]

{ #category : #'as yet unclassified' }
PyramidControlMoveLayer >> startDragEvent: anEvent [

	self isStarted ifTrue: [ ^ self ].
	anEvent middleButtonPressed ifFalse: [ ^ self ].
	self startingPosition:  anEvent position.
	self currentOffset: self canvas position.
	self isStarted: true
]

{ #category : #'as yet unclassified' }
PyramidControlMoveLayer >> startingPosition [

^ 	startingPosition 
]

{ #category : #'as yet unclassified' }
PyramidControlMoveLayer >> startingPosition: anObject [
startingPosition:= anObject
]

{ #category : #'as yet unclassified' }
PyramidControlMoveLayer >> stopDragEvent: anEvent [

	self isStarted ifFalse: [ ^ self ].
	self isStarted: false
]

{ #category : #'as yet unclassified' }
PyramidControlMoveLayer >> wheelSpeed [

	^ 9
]
