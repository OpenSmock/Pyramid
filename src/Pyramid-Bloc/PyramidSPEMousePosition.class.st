Class {
	#name : #PyramidSPEMousePosition,
	#superclass : #PyramidSpacePluginExtension,
	#instVars : [
		'catchPositionOverlay',
		'displayPositionOverlay',
		'elementDisplay',
		'positionText',
		'mutex'
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
		                  background: Color white;
		                  size: 100 @ 20;
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
]

{ #category : #'as yet unclassified' }
PyramidSPEMousePosition >> makePositionText: aPoint [

	^ aPoint printString asRopedText asElement
	
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

	| newPositionText |
	mutex critical: [
	newPositionText := self makePositionText: aPoint.
	self elementDisplay removeChild: self positionText.
	self elementDisplay addChild: newPositionText.
	self positionText: newPositionText ]
]
