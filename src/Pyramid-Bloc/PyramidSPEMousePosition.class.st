Class {
	#name : #PyramidSPEMousePosition,
	#superclass : #PyramidSpacePluginExtension,
	#instVars : [
		'catchPositionOverlay',
		'displayPositionOverlay'
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

{ #category : #initialization }
PyramidSPEMousePosition >> initialize [

	| elementEventCatcher elementDisplay |
	elementEventCatcher := BlElement new
		                       id: #mouse_catch;
		                       constraintsDo: [ :c |
			                       c vertical matchParent.
			                       c horizontal matchParent ];
		                       yourself.
	elementEventCatcher
		when: BlMouseMoveEvent
		do: [ :evt | Transcript crShow: evt position printString ].
	elementDisplay := BlElement new id: #mouse_display; yourself.

	catchPositionOverlay := PyramidOverlay new
		                        position: 4;
		                        element: elementEventCatcher;
		                        yourself.
	displayPositionOverlay := PyramidOverlay new
		                          position: 5;
		                          element: elementDisplay;
		                          yourself
]

{ #category : #'as yet unclassified' }
PyramidSPEMousePosition >> installOnSpacePlugin: aSpacePlugin [

	aSpacePlugin overlaysManager addOverlay: self catchPositionOverlay.
	aSpacePlugin overlaysManager addOverlay: self displayPositionOverlay.
]
