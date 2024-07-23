Class {
	#name : #PyramidSpaceBuilder,
	#superclass : #Object,
	#traits : 'TPyramidEditorTransformation + TPyramidEditorSpaceIsReady',
	#classTraits : 'TPyramidEditorTransformation classTrait + TPyramidEditorSpaceIsReady classTrait',
	#instVars : [
		'topMostOverlay',
		'overlays',
		'space',
		'keyboard',
		'extensions'
	],
	#classInstVars : [
		'defaultEditorExtensions'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #'as yet unclassified' }
PyramidSpaceBuilder class >> defaultEditorBuilder [

	<script: '
	| builder space |
	builder := self defaultEditorBuilder.
	space := builder build.
	(builder elementAt: #main) addChild: (BlElement new background: Color red; yourself).
	space show'>
	| builder |
	builder := self new
		           addAllOverlaysNamed:
			           { #displays. #transforms. #main. #events. #widgets };
		           yourself.

	(builder overlays at: #displays) element addChild: (BlElement new id: #displaysAddons; clipChildren: false; yourself).
	self defaultEditorExtensions do: [ :class |
		builder addExtension: class new ].

	^ builder
]

{ #category : #accessing }
PyramidSpaceBuilder class >> defaultEditorExtensions [

	<script: 'defaultEditorExtensions := nil'>
	defaultEditorExtensions ifNil: [
		defaultEditorExtensions := {
			                           PyramidPositionExtension.
			                           PyramidMouseTransformExtension.
			                           PyramidWheelTransformExtension.
			                           PyramidSelectionMakerExtension.
			                           PyramidSelectionWidgetExtension.
			                           PyramidMenuExtension.
			                           PyramidMainExtension } ].
	^ defaultEditorExtensions
]

{ #category : #adding }
PyramidSpaceBuilder >> addAllOverlaysNamed: aCollection [

	aCollection reverseDo: [ :each | self addOverlayNamed: each ]
]

{ #category : #adding }
PyramidSpaceBuilder >> addExtension: anExtension [

	anExtension installOn: self.
	self extensions add: anExtension
]

{ #category : #adding }
PyramidSpaceBuilder >> addOverlayNamed: aString [

	| overlay |
	self overlays
		at: aString
		ifPresent: [ PyramidExistingOverlayError signal ].

	self overlays
		ifEmpty: [ overlay := PyramidSpaceMainOverlay new ]
		ifNotEmpty: [
			overlay := PyramidSpaceOverlayDecorator new.
			overlay wrappee: self topMostOverlay ].

	overlay element id: aString.
	overlays at: aString put: overlay.
	self topMostOverlay: overlay
]

{ #category : #'as yet unclassified' }
PyramidSpaceBuilder >> build [

	self space: BlSpace new.
	self space userData at: #pyramid_isEditor put: true.

	self overlays ifEmpty: [ ^ self space ].

	self space addEventHandler: (BlEventHandler
			 on: BlKeyDownEvent
			 do: [ :evt | self keyboard add: evt key ]).
	self space addEventHandler: (BlEventHandler
			 on: BlKeyUpEvent
			 do: [ :evt | self keyboard remove: evt key ]).

	self signalTransformationChanged.
	self topMostOverlay buildOn: self space root.
	self signalSpaceIsReady.
	^ self space
]

{ #category : #accessing }
PyramidSpaceBuilder >> editor: aPyramidEditor [

	self extensions do: [ :each | each editor: aPyramidEditor ].
	self extensions do: [ :each |
		each projectModel: aPyramidEditor projectModel ]
]

{ #category : #accessing }
PyramidSpaceBuilder >> elementAt: aString [

	^ (self overlays at: aString) element
]

{ #category : #accessing }
PyramidSpaceBuilder >> extensions [
^ extensions
]

{ #category : #initialization }
PyramidSpaceBuilder >> initialize [

	overlays := Dictionary new.
	keyboard := Set new.
	extensions := Set new
]

{ #category : #accessing }
PyramidSpaceBuilder >> keyboard [

	^ keyboard
]

{ #category : #initialization }
PyramidSpaceBuilder >> overlays [
	^ overlays
]

{ #category : #accessing }
PyramidSpaceBuilder >> space [

	^ space
]

{ #category : #accessing }
PyramidSpaceBuilder >> space: anObject [

	space := anObject
]

{ #category : #accessing }
PyramidSpaceBuilder >> topMostOverlay [

	^ topMostOverlay
]

{ #category : #accessing }
PyramidSpaceBuilder >> topMostOverlay: anObject [

	topMostOverlay := anObject
]
