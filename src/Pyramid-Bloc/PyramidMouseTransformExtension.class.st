Class {
	#name : 'PyramidMouseTransformExtension',
	#superclass : 'Object',
	#traits : 'TPyramidSpaceExtension + TPyramidEditorExtension',
	#classTraits : 'TPyramidSpaceExtension classTrait + TPyramidEditorExtension classTrait',
	#instVars : [
		'isDragging',
		'origin'
	],
	#category : 'Pyramid-Bloc-plugin-space-extensions',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-space-extensions'
}

{ #category : 'initialization' }
PyramidMouseTransformExtension >> initialize [

	isDragging:= false.
	origin := 0 @ 0.
]

{ #category : 'displaying' }
PyramidMouseTransformExtension >> installOn: aBuilder [

	self builder: aBuilder.

	self elementAtEvents addEventHandler: (BlEventHandler
			 on: BlMiddleMouseDownEvent
			 do: [ :evt |
				 self origin: self currentTransformTranslation - evt position.
				 self isDragging: true ]).

	self elementAtEvents addEventHandler: (BlEventHandler
			 on: BlMouseMoveEvent
			 do: [ :evt |
				 evt middleButtonPressed ifFalse: [ self isDragging: false ].
				 self isDragging ifTrue: [
					 self elementAtTransforms transformDo: [ :t |
						 t translateBy: evt position + self origin ].
					 self builder signalTransformationChanged ] ]).
	self elementAtEvents addEventHandler: (BlEventHandler
			 on: BlMiddleMouseUpEvent
			 do: [ :evt | self isDragging: false ])
]

{ #category : 'accessing' }
PyramidMouseTransformExtension >> isDragging [

	^ isDragging
]

{ #category : 'accessing' }
PyramidMouseTransformExtension >> isDragging: anObject [

	isDragging := anObject
]

{ #category : 'accessing' }
PyramidMouseTransformExtension >> origin [

	^ origin
]

{ #category : 'accessing' }
PyramidMouseTransformExtension >> origin: anObject [

	origin := anObject
]
