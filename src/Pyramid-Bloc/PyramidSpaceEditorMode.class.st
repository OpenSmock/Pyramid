Class {
	#name : #PyramidSpaceEditorMode,
	#superclass : #PyramidSpaceMode,
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #initialization }
PyramidSpaceEditorMode >> initialize [

	super initialize.
	self installExtensions.
]

{ #category : #'as yet unclassified' }
PyramidSpaceEditorMode >> installExtensions [

	self installMousePosition.
	self installTransformMouseMovement.
	self installTransformWheelMovement
]

{ #category : #'as yet unclassified' }
PyramidSpaceEditorMode >> installMousePosition [

	self addExtension: [ :b |
		| display |
		display := (0 @ 0) asRopedText asElement.
		display
			background: Color white;
			zIndex: 1;
			padding: (BlInsets all: 3).
		(b elementAt: #events) when: BlMouseMoveEvent do: [ :evt |
			| matrix |
			matrix := (b elementAt: #transforms) transformation matrix. display
				          text: (evt position - (matrix x @ matrix y)) asRopedText ].
		(b elementAt: #displays) addChild: display ]
]

{ #category : #'as yet unclassified' }
PyramidSpaceEditorMode >> installTransformMouseMovement [

	self addExtension: [ :b |
		| origin isDragging matrix |
		isDragging := false.
		(b elementAt: #events) when: BlMiddleMouseDownEvent do: [ :evt |
			matrix := (b elementAt: #transforms) transformation matrix.
			origin := matrix x @ matrix y - evt position.
			isDragging := true ].

		(b elementAt: #events) when: BlMouseMoveEvent do: [ :evt |
			evt middleButtonPressed ifFalse: [ isDragging := false ].
			isDragging ifTrue: [
				(b elementAt: #transforms) transformDo: [ :t |
					t translateBy: evt position + origin ] ] ].
		(b elementAt: #events)
			when: BlMiddleMouseUpEvent
			do: [ :evt | isDragging := false ] ]
]

{ #category : #'as yet unclassified' }
PyramidSpaceEditorMode >> overlayNames [

	^ { #widgets. #events. #displays. #transforms }
]
