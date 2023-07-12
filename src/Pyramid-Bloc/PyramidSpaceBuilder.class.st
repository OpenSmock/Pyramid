Class {
	#name : #PyramidSpaceBuilder,
	#superclass : #Object,
	#instVars : [
		'rootsContainer',
		'topMostContainer',
		'overlays',
		'space'
	],
	#classInstVars : [
		'defaultEditorExtensions'
	],
	#category : #'Pyramid-Bloc-plugin-space-extensions'
}

{ #category : #'as yet unclassified' }
PyramidSpaceBuilder class >> defaultEditorBuilder [

	| builder |
	builder := self new
		           addAllOverlaysNamed:
			           { #widgets. #events. #displays. #transforms };
		           yourself.

	self defaultEditorExtensions do: [ :each | builder addExtension: each ].
	^ builder
]

{ #category : #accessing }
PyramidSpaceBuilder class >> defaultEditorExtensions [

	defaultEditorExtensions ifNil: [ defaultEditorExtensions := {  } ].
	^ defaultEditorExtensions
]

{ #category : #adding }
PyramidSpaceBuilder >> addAllOverlaysNamed: aCollection [

	aCollection reverseDo: [ :each | self addOverlayNamed: each ]
]

{ #category : #adding }
PyramidSpaceBuilder >> addExtension: aBlock [

	aBlock installOn: self
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
	self topMostContainer buildOn: self space root.
	^ self space
]

{ #category : #accessing }
PyramidSpaceBuilder >> elementAt: aString [

	^ (self overlays at: aString) element
]

{ #category : #initialization }
PyramidSpaceBuilder >> initialize [

	rootsContainer := PyramidSpaceRootsContainer new.
	topMostContainer := rootsContainer.
	overlays := Dictionary new.
]

{ #category : #initialization }
PyramidSpaceBuilder >> overlays [
	^ overlays
]

{ #category : #accessing }
PyramidSpaceBuilder >> projectModel: aProjectModel [

	self rootsContainer projectModel: aProjectModel
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
