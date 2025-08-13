Class {
	#name : #PyramidSelectionMakerExtension,
	#superclass : #Object,
	#traits : 'TPyramidSpaceExtension + TPyramidEditorExtension + TPyramidKeyboardExtension',
	#classTraits : 'TPyramidSpaceExtension classTrait + TPyramidEditorExtension classTrait + TPyramidKeyboardExtension classTrait',
	#instVars : [
		'selectionGhost',
		'isDragging',
		'dragOrigin',
		'projectModel'
	],
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #'as yet unclassified' }
PyramidSelectionMakerExtension >> computeAdditiveSelection: aCollection [

	| newSelection |
	self projectModel ifNil: [ ^ self ].
	newSelection := aCollection | self projectModel selection collection.
	self projectModel selection replaceAll: newSelection
]

{ #category : #'as yet unclassified' }
PyramidSelectionMakerExtension >> computeExclusifSelection: aCollection [

	| newSelection oldCollection |
	self projectModel ifNil: [ ^ self ].
	oldCollection := self projectModel selection collection.
	newSelection := aCollection | oldCollection \ (aCollection & oldCollection).
	self projectModel selection replaceAll: newSelection
]

{ #category : #'as yet unclassified' }
PyramidSelectionMakerExtension >> computeNormalSelection: aCollection [

	self projectModel ifNil: [ ^ self ].
	self projectModel setSelection: aCollection
]

{ #category : #'as yet unclassified' }
PyramidSelectionMakerExtension >> computeSelection: anEvent [

	| collection |
	collection := (anEvent position closeTo: self dragOrigin epsilon: 2)
		              ifTrue: [ self selectFirstElementAt: anEvent position ]
		              ifFalse: [
		              self selectAllElementsInBound:
			              self selectionGhost boundsInSpace ].

	self isOnlyCtrlKeyPressed ifTrue: [
		^ self computeExclusifSelection: collection ].
	self isOnlyShiftKeyPressed ifTrue: [
		^ self computeAdditiveSelection: collection ].
	self computeNormalSelection: collection
]

{ #category : #'event handling' }
PyramidSelectionMakerExtension >> dragEnd: anEvent [

	self isDragging: false.
	self computeSelection: anEvent.
	self selectionGhost visibility: BlVisibility gone
]

{ #category : #'event handling' }
PyramidSelectionMakerExtension >> dragEvent: anEvent [

	| xmin ymin "newY newX" |
	self isDragging ifFalse: [ ^ self ].
	(anEvent primaryButtonPressed or: [ anEvent secondaryButtonPressed ])
		ifFalse: [
			self dragEnd: anEvent.
			^ self ].

	xmin := self dragOrigin x min: anEvent position x.
	ymin := self dragOrigin y min: anEvent position y.

	self selectionGhost
		position: xmin @ ymin;
		extent: (anEvent position - self dragOrigin) abs
]

{ #category : #accessing }
PyramidSelectionMakerExtension >> dragOrigin [

	^ dragOrigin
]

{ #category : #accessing }
PyramidSelectionMakerExtension >> dragOrigin: anObject [

	dragOrigin := anObject
]

{ #category : #'event handling' }
PyramidSelectionMakerExtension >> dragStart: anEvent [

	self isDragging: true.
	self dragOrigin: anEvent position.

	self selectionGhost
		extent: 0 @ 0;
		position: self dragOrigin;
		visibility: BlVisibility visible
]

{ #category : #initialization }
PyramidSelectionMakerExtension >> initialize [

	isDragging := false.
	selectionGhost := BlElement new
		                  background: Color blue translucent;
		zIndex: 1;
		                  visibility: BlVisibility gone;
		                  yourself
]

{ #category : #displaying }
PyramidSelectionMakerExtension >> installOn: aBuilder [

	self builder: aBuilder.

	self elementAtDisplaysAddons addChild: self selectionGhost.
	self elementAtEvents addEventHandler: (BlEventHandler
			 on: BlPrimaryMouseDownEvent
			 do: [ :evt | self dragStart: evt ]).
	self elementAtEvents addEventHandler: (BlEventHandler
			 on: BlSecondaryMouseDownEvent
			 do: [ :evt | self dragStart: evt ]).

	self elementAtEvents addEventHandler: (BlEventHandler
			 on: BlMouseMoveEvent
			 do: [ :evt | self dragEvent: evt ]).

	self elementAtEvents addEventHandler: (BlEventHandler
			 on: BlPrimaryMouseUpEvent
			 do: [ :evt | self dragEnd: evt ]).
	self elementAtEvents addEventHandler: (BlEventHandler
			 on: BlSecondaryMouseUpEvent
			 do: [ :evt | self dragEnd: evt ])
]

{ #category : #accessing }
PyramidSelectionMakerExtension >> isDragging [

	^ isDragging
]

{ #category : #accessing }
PyramidSelectionMakerExtension >> isDragging: anObject [

	isDragging := anObject
]

{ #category : #accessing }
PyramidSelectionMakerExtension >> projectModel [

	^ projectModel
]

{ #category : #accessing }
PyramidSelectionMakerExtension >> projectModel: aProjectModel [

	projectModel := aProjectModel

	
]

{ #category : #'as yet unclassified' }
PyramidSelectionMakerExtension >> selectAllElementsInBound: aBound [


	self projectModel ifNil: [ ^ {  } ].
	^ self projectModel allElements select: [ :each |
		                   aBound containsRect: each boundsInSpace ].
]

{ #category : #'as yet unclassified' }
PyramidSelectionMakerExtension >> selectFirstElementAt: aPosition [

	| selectedElements |
	self projectModel ifNil: [ ^ {  } ].
	selectedElements := self projectModel allElements select: [ :each |
		                    each boundsInSpace containsPoint: aPosition ].
	selectedElements ifEmpty: [ ^ {  } ].
	^ { selectedElements last }
]

{ #category : #accessing }
PyramidSelectionMakerExtension >> selectionGhost [

	^ selectionGhost
]
