Class {
	#name : #PyramidOverlayBuilder,
	#superclass : #Object,
	#instVars : [
		'model',
		'overlay'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #'as yet unclassified' }
PyramidOverlayBuilder class >> fakeWindowBlock [

	^ [ :builder |
	  | windowDisplay |
	  builder
		  at: #size
		  subscribeWith: [ :size |
		  builder overlay overlayElement size: size ].

	  windowDisplay := BlElement new
		                   constraintsDo: [ :c |
			                   c horizontal matchParent.
			                   c vertical matchParent ];
		                   background: BlBackground transparent;
		                   border: (BlBorder paint: Color blue width: 1);
		                   outskirts: BlOutskirts outside;
		                   yourself.
	  builder
		  name: #fakeWindow;
		  constraintsSize: (builder at: #size);
		  clipChildren: false;
		  addElement: windowDisplay ]
]

{ #category : #'as yet unclassified' }
PyramidOverlayBuilder class >> mousePositionBlock [

	^ [ :builder |
	  | textDisplay rope |
	  textDisplay := (builder at: #origin) asRopedText asElement.
	  textDisplay
		  background: Color white;
		  padding: (BlInsets top: 3).
	  builder
		  name: #mousePosition;
		  constraintsMatchParent;
		  clipChildren: false;
		  addElement: textDisplay;
		  addEventWhen: BlMouseMoveEvent do: [ :evt |
			  rope := (evt position - (builder at: #origin)) printString
				          asRopedText.
			  textDisplay text: rope ] ]
]

{ #category : #'as yet unclassified' }
PyramidOverlayBuilder class >> movementMouseEventBlock [

	^ [ :builder |
	  | isDragging startPosition |
	  builder
		  name: #movementMouseEvent;
		  constraintsMatchParent;
		  clipChildren: false.

	  isDragging := false.
	  startPosition := builder at: #origin.
	  builder addEventWhen: BlMouseDownEvent do: [ :evt |
		  evt middleButtonPressed ifTrue: [
			  isDragging := true.
			  startPosition := evt position - (builder at: #origin) ] ].
	  builder addEventWhen: BlMouseMoveEvent do: [ :evt |
		  evt middleButtonPressed
			  ifTrue: [ isDragging ifTrue: [ builder at: #origin put: evt position - startPosition ] ]
			  ifFalse: [ isDragging ifTrue: [ isDragging := false ] ] ].
	  builder
		  addEventWhen: BlMouseUpEvent
		  do: [ :evt |
		  evt middleButtonPressed ifTrue: [ isDragging := false ] ] ]
]

{ #category : #'as yet unclassified' }
PyramidOverlayBuilder class >> movementTransformationBlock [

	^ [ :builder |
	  builder
		  at: #origin
		  subscribeWith: [ :origin |
		  builder overlay overlayElement position: origin ].

	  builder
		  name: #movementTransformation;
		  constraintsMatchParent;
		  position: (builder at: #origin);
		  clipChildren: false ]
]

{ #category : #'as yet unclassified' }
PyramidOverlayBuilder class >> movementWheelEventBlock [

	^ [ :builder |
	  | noKeyPressed shiftKeyPressed |
	  builder at: #keyboardPressed subscribeWith: [ :col |
		  noKeyPressed := col isEmpty.
		  shiftKeyPressed := col allSatisfy: [ :key | key isShift ] ].

	  builder
		  name: #movementWheelEvent;
		  constraintsMatchParent;
		  clipChildren: false.

	  noKeyPressed := true.
	  shiftKeyPressed := false.

	  builder addEventWhen: BlMouseWheelEvent do: [ :evt |
		  noKeyPressed
			  ifTrue: [
				  builder
					  at: #origin
					  put: ((builder at: #origin) + (evt vector asPoint * 10)) ]
			  ifFalse: [
				  shiftKeyPressed ifTrue: [
					  builder
						  at: #origin
						  put:
						  (builder at: #origin) + (evt vector asPoint leftRotated * 10) ] ] ] ]
]

{ #category : #'as yet unclassified' }
PyramidOverlayBuilder class >> selectionDisplayBlock [

	^ [ :builder |
	  | controller |
	  builder
		  name: #selectionDisplay;
		  constraintsMatchParent;
		  clipChildren: false.
	  controller := PyramidSelectionDisplayController new
		                overlay: builder overlay;
		                origin: (builder model at: #origin);
		                yourself.
	  builder
		  at: #origin
		  subscribeWith: [ :editor | controller updateOriginPreviews ].

	  builder
		  at: #editor
		  subscribeWith: [ :editor |
		  controller activeProject: editor activeProject.
		  controller pipeline: editor commandPipeline ] ]
]

{ #category : #'as yet unclassified' }
PyramidOverlayBuilder class >> selectionMakerBlock [

	^ [ :builder |
	  | controller |
	  builder
		  name: #selectionMaker;
		  constraintsMatchParent;
		  clipChildren: false.
	  controller := PyramidSelectionMakerController new
		                overlay: builder overlay;
		                keyboardPressed: (builder at: #keyboardPressed);
		                yourself.
	  builder
		  at: #editor
		  subscribeWith: [ :editor |
		  controller updateEditor: editor ] ]
]

{ #category : #'api - resizer' }
PyramidOverlayBuilder >> addElement: aBlElement [

	self addElement: aBlElement atElevation: 200
]

{ #category : #'api - resizer' }
PyramidOverlayBuilder >> addElement: aBlElement atElevation: aNumber [

	aBlElement zIndex: aNumber.
	self overlay overlayElement addChild: aBlElement
]

{ #category : #'api - resizer' }
PyramidOverlayBuilder >> addEventWhen: anEventClass do: aBlock [

	self overlay overlayElement when: anEventClass do: aBlock
]

{ #category : #accessing }
PyramidOverlayBuilder >> at: aKey [

	^ (self model at: aKey )object
]

{ #category : #accessing }
PyramidOverlayBuilder >> at: aKey put: anObject [

	(self model at: aKey) object: anObject
]

{ #category : #accessing }
PyramidOverlayBuilder >> at: aKey subscribeWith: aBlock [

		(self model
		at: aKey) subcribe: self with: aBlock
]

{ #category : #building }
PyramidOverlayBuilder >> build [

	^ self overlay
]

{ #category : #'api - resizer' }
PyramidOverlayBuilder >> clipChildren: aBoolean [

	self overlay overlayElement clipChildren: aBoolean
]

{ #category : #'api - resizer' }
PyramidOverlayBuilder >> constraintsMatchParent [

	self overlay overlayElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ]
]

{ #category : #'api - resizer' }
PyramidOverlayBuilder >> constraintsSize: anExtent [

	self overlay overlayElement constraintsDo: [ :c |
		c horizontal exact: anExtent x.
		c vertical exact: anExtent y ]
]

{ #category : #initialization }
PyramidOverlayBuilder >> initialize [

	overlay := PyramidOverlay new
]

{ #category : #accessing }
PyramidOverlayBuilder >> model [

	^ model
]

{ #category : #accessing }
PyramidOverlayBuilder >> model: anObject [

	model := anObject.
	self overlay model: anObject
]

{ #category : #accessing }
PyramidOverlayBuilder >> name: aString [

	self overlay name: aString.
	self overlay overlayElement id: aString asSymbol
]

{ #category : #building }
PyramidOverlayBuilder >> overlay [

	^ overlay
]

{ #category : #'api - resizer' }
PyramidOverlayBuilder >> position: aPoint [

	self overlay overlayElement position: aPoint
]
