Class {
	#name : #PyramidSpaceBuilder,
	#superclass : #Object,
	#instVars : [
		'rootsContainer',
		'topMostContainer',
		'overlays',
		'space',
		'keyboard',
		'extensions'
	],
	#classInstVars : [
		'defaultEditorExtensions'
	],
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #'as yet unclassified' }
PyramidSpaceBuilder class >> defaultEditorBuilder [

	<script: '
	| builder |
	builder := self defaultEditorBuilder.
	builder rootsContainer element addChild: (BlElement new background: Color red; yourself).
	builder build show'>
	| builder |
	builder := self new
		           addAllOverlaysNamed:
			           { #widgets. #events. #displays. #transforms };
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
	overlay := PyramidSpaceOverlayDecorator new.
	overlay element id: aString.

	overlays at: aString put: overlay.

	overlay wrappee: self topMostContainer.
	self topMostContainer: overlay.
	
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

	self extensions do: [ :each | each editor: aPyramidEditor ]
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

	rootsContainer := PyramidSpaceRootsContainer new.
	topMostContainer := rootsContainer.
	overlays := Dictionary new.
	keyboard := Set new.
	extensions := Set new.
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
PyramidSpaceBuilder >> projectModel: aProjectModel [

	self rootsContainer projectModel: aProjectModel.
	self extensions do: [ :each | each projectModel: aProjectModel ]
]

{ #category : #accessing }
PyramidSpaceBuilder >> rootsContainer [

^ rootsContainer
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
