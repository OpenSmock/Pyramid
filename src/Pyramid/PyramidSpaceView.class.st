Class {
	#name : #PyramidSpaceView,
	#superclass : #SpPresenter,
	#traits : 'TPyramidActiveProjectModelObserver',
	#classTraits : 'TPyramidActiveProjectModelObserver classTrait',
	#instVars : [
		'editor',
		'builder'
	],
	#category : #'Pyramid-plugin-central'
}

{ #category : #accessing }
PyramidSpaceView >> builder [
^ builder
]

{ #category : #layout }
PyramidSpaceView >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		  add: self builder presenter expand: true;
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
PyramidSpaceView >> initializePresenters [

	builder := PyramidSpaceBuilder new.
	self whenDisplayDo: [ builder space show ].
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
PyramidSpaceView >> roots: aCollection [

	self builder canvas removeChildren.
	self builder canvas addChildren: aCollection elements
]
