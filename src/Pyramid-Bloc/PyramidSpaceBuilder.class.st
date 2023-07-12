Class {
	#name : #PyramidSpaceBuilder,
	#superclass : #Object,
	#traits : 'TPyramidEditorTransformation',
	#classTraits : 'TPyramidEditorTransformation classTrait',
	#instVars : [
		'topMostContainer',
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

	self defaultEditorExtensions do: [ :class |
		builder addExtension: class new ].

	^ builder
]

{ #category : #accessing }
PyramidSpaceBuilder class >> defaultEditorExtensions [

	<script: 'defaultEditorExtensions := nil'>
	defaultEditorExtensions ifNil: [
		defaultEditorExtensions := {
			                           PyramidMainExtension.
				                           PyramidPositionExtension.
			                           PyramidMouseTransformExtension.
			                           PyramidWheelTransformExtension.
			                           PyramidSelectionMakerExtension.
			                           PyramidSelectionWidgetExtension } ].
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
		ifEmpty: [ overlay := PyramidSpaceMainOverlay new ]
		ifNotEmpty: [
			overlay := PyramidSpaceOverlayDecorator new.
			overlay wrappee: self topMostContainer ].

	overlay element id: aString.
	overlays at: aString put: overlay.
	self topMostContainer: overlay
]

{ #category : #'as yet unclassified' }
PyramidSpaceBuilder >> build [

	self space: BlSpace new.

	self space
		when: BlKeyDownEvent
		do: [ :evt | self keyboard add: evt key ].
	self space
		when: BlKeyUpEvent
		do: [ :evt | self keyboard remove: evt key ].

	self topMostContainer buildOn: self space root.
	^ self space
]

{ #category : #accessing }
PyramidSpaceBuilder >> editor: aPyramidEditor [

	self extensions do: [ :each | each editor: aPyramidEditor ].
	self extensions do: [ :each | each projectModel: aPyramidEditor activeProject ]
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
PyramidSpaceBuilder >> topMostContainer [
^ topMostContainer
]

{ #category : #accessing }
PyramidSpaceBuilder >> topMostContainer: anObject [

	topMostContainer:= anObject
]
