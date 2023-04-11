Class {
	#name : #PyramidPluginTree,
	#superclass : #Object,
	#traits : 'TPyramidPlugin + TPyramidActiveProjectModelObserver',
	#classTraits : 'TPyramidPlugin classTrait + TPyramidActiveProjectModelObserver classTrait',
	#instVars : [
		'activeProject',
		'view'
	],
	#category : #'NeoPyramid-plugin-tree'
}

{ #category : #initialization }
PyramidPluginTree class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #accessing }
PyramidPluginTree >> activeProject [

	^ activeProject
]

{ #category : #accessing }
PyramidPluginTree >> activeProject: anActiveProject [

	activeProject := anActiveProject.
	activeProject addObserver: self
]

{ #category : #'as yet unclassified' }
PyramidPluginTree >> buildGlobalViewOn: aPyramidGlobalViewBuilder [

	aPyramidGlobalViewBuilder leftElements add: self view
]

{ #category : #'as yet unclassified' }
PyramidPluginTree >> connectOn: aPyramidEditor [

	self activeProject: aPyramidEditor activeProject.
	
]

{ #category : #initialization }
PyramidPluginTree >> initialize [
	self initializeView
]

{ #category : #initialization }
PyramidPluginTree >> initializeView [

	view := PyramidTab new title: 'Tree'; icon: (self iconNamed: #catalog); presenter: PyPanelTree new; yourself
]

{ #category : #'as yet unclassified' }
PyramidPluginTree >> pyramidActiveProjectChangedChanged [

	self updateRoots.
	self updateSelection
]

{ #category : #'as yet unclassified' }
PyramidPluginTree >> pyramidRootsChangedOnActiveProject [

	self updateRoots
]

{ #category : #'as yet unclassified' }
PyramidPluginTree >> pyramidSelectionChangedOnActiveProject [

	self updateSelection
]

{ #category : #initialization }
PyramidPluginTree >> view [

	^ view
]
