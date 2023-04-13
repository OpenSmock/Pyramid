Class {
	#name : #PyramidSpaceView,
	#superclass : #SpPresenter,
	#traits : 'TPyramidActiveProjectModelObserver',
	#classTraits : 'TPyramidActiveProjectModelObserver classTrait',
	#instVars : [
		'morphPresenter',
		'space',
		'editor'
	],
	#category : #'NeoPyramid-plugin-central'
}

{ #category : #layout }
PyramidSpaceView >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		  add: self morphPresenter expand: true;
		  yourself
]

{ #category : #accessing }
PyramidSpaceView >> editor [
	^ editor
]

{ #category : #accessing }
PyramidSpaceView >> editor: anEditor [

	editor := anEditor.
	editor activeProject addObserver: self.
	self pyramidActiveProjectChangedChanged
]

{ #category : #initialization }
PyramidSpaceView >> initializeNewMorphicSpace [

	| host morph |
	morph := Morph new.
	morph layoutPolicy: TableLayout new.

	host := PyMorphicAlexandrieHost new.
	host containerMorph: morph.

	space := BlSpace new.
	space host: host.

	self whenDisplayDo: [ space show ].

	^ morph
]

{ #category : #initialization }
PyramidSpaceView >> initializePresenters [

	morphPresenter := self newMorph.
	morphPresenter morph: self initializeNewMorphicSpace.
]

{ #category : #accessing }
PyramidSpaceView >> morphPresenter [

	^ morphPresenter
]

{ #category : #'as yet unclassified' }
PyramidSpaceView >> pyramidActiveProjectChangedChanged [

	self roots: self editor activeProject roots
]

{ #category : #'as yet unclassified' }
PyramidSpaceView >> pyramidRootsChangedOnActiveProject [

	self roots: self editor activeProject roots
]

{ #category : #accessing }
PyramidSpaceView >> rootLayer [

	^ self space root
]

{ #category : #accessing }
PyramidSpaceView >> roots: aCollection [

	self rootLayer removeChildren.
	self rootLayer addChildren: aCollection elements
]

{ #category : #accessing }
PyramidSpaceView >> space [

	^ space
]
