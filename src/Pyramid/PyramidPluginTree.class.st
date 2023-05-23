Class {
	#name : #PyramidPluginTree,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'activeProject',
		'view'
	],
	#category : #'Pyramid-plugin-tree'
}

{ #category : #initialization }
PyramidPluginTree class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #adding }
PyramidPluginTree >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabLeft addItem: [ :builder |
		builder
			makeTab: self view
			label: 'Tree'
			icon: (self iconNamed: #catalog)
			order: 1 ]
]

{ #category : #'as yet unclassified' }
PyramidPluginTree >> connectOn: aPyramidEditor [

	self view activeProject: aPyramidEditor activeProject.
	aPyramidEditor commandPipeline addObserver: self view
]

{ #category : #initialization }
PyramidPluginTree >> initialize [

		view := PyramidTreeView new
]

{ #category : #initialization }
PyramidPluginTree >> view [

	^ view
]
