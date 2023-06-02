Class {
	#name : #PyramidSPEMousePosition,
	#superclass : #PyramidSpacePluginExtension,
	#instVars : [
		'catchPositionOverlay',
		'displayPositionOverlay',
		'elementDisplay',
		'positionText',
		'mutex',
		'rootElement'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #accessing }
PyramidSPEMousePosition >> catchPositionOverlay [

	^ catchPositionOverlay
]

{ #category : #accessing }
PyramidSPEMousePosition >> displayPositionOverlay [

	^ displayPositionOverlay
]

{ #category : #accessing }
PyramidSPEMousePosition >> elementDisplay [

	^ elementDisplay
]

{ #category : #initialization }
PyramidSPEMousePosition >> initialize [

	mutex := Mutex new.
	self initializeElementDisplay.
	self initializeElementEventCatcher
]

{ #category : #initialization }
PyramidSPEMousePosition >> initializeElementDisplay [

	positionText := self makePositionText: 0 @ 0.
	elementDisplay := BlElement new
		                  id: #mouse_display;
		                   constraintsDo: [ :c |
			                       c vertical matchParent.
			                       c horizontal matchParent ];
		                  addChild: positionText;
		                  yourself.

	displayPositionOverlay := PyramidOverlay new
		                          position: 5;
		                          element: elementDisplay;
		                          yourself
]

{ #category : #initialization }
PyramidSPEMousePosition >> initializeElementEventCatcher [

	| elementEventCatcher |
	elementEventCatcher := BlElement new
		                       id: #mouse_catch;
		                       constraintsDo: [ :c |
			                       c vertical matchParent.
			                       c horizontal matchParent ];
		                       yourself.
	elementEventCatcher
		when: BlMouseMoveEvent
		do: [ :evt | self refreshPosition: evt position ].

	catchPositionOverlay := PyramidOverlay new
		                        position: 4;
		                        element: elementEventCatcher;
		                        yourself
]

{ #category : #'as yet unclassified' }
PyramidSPEMousePosition >> installOnSpacePlugin: aSpacePlugin [

	aSpacePlugin overlaysManager addOverlay: self catchPositionOverlay.
	aSpacePlugin overlaysManager addOverlay: self displayPositionOverlay.
	self rootElement: aSpacePlugin overlaysManager rootElement
]

{ #category : #'as yet unclassified' }
PyramidSPEMousePosition >> makePositionText: aPoint [
	| element |
	element := aPoint printString asRopedText asElement.
	element background: Color white.
	^ element
]

{ #category : #accessing }
PyramidSPEMousePosition >> positionText [

	^ positionText
]

{ #category : #accessing }
PyramidSPEMousePosition >> positionText: anObject [

	positionText := anObject
]

{ #category : #'as yet unclassified' }
PyramidSPEMousePosition >> refreshPosition: aPoint [

	| newPositionText newPosition |
	mutex critical: [
		newPosition := aPoint - ( self rootElement localPointToGlobal: 0 @ 0 ).
		newPositionText := self makePositionText: newPosition.
		self elementDisplay removeChild: self positionText.
		self elementDisplay addChild: newPositionText.
		self positionText: newPositionText ]
]

{ #category : #'as yet unclassified' }
PyramidSPEMousePosition >> rootElement [

	^ rootElement
]

{ #category : #'as yet unclassified' }
PyramidSPEMousePosition >> rootElement: anObject [
rootElement:= anObject
]
