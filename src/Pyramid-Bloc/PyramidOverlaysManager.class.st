Class {
	#name : #PyramidOverlaysManager,
	#superclass : #Object,
	#instVars : [
		'spaceOverlay',
		'rootOverlay',
		'overlays'
	],
	#category : #'Pyramid-Bloc-plugin-space'
}

{ #category : #adding }
PyramidOverlaysManager >> addOverlay: anOverlay [

	self spaceOverlay connectTo: anOverlay.
	self overlays add: anOverlay
]

{ #category : #initialization }
PyramidOverlaysManager >> initialize [

	overlays := OrderedCollection new.
	spaceOverlay := PyramidSpaceOverlay new.
	rootOverlay := PyramidRootOverlay new.

	spaceOverlay element addChild: rootOverlay element.
	spaceOverlay son: rootOverlay.
	rootOverlay father: spaceOverlay
]

{ #category : #accessing }
PyramidOverlaysManager >> overlays [

	^ overlays
]

{ #category : #accessing }
PyramidOverlaysManager >> rootOverlay [

	^ rootOverlay
]

{ #category : #accessing }
PyramidOverlaysManager >> spaceOverlay [
^ spaceOverlay
]
