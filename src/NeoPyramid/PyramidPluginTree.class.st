Class {
	#name : #PyramidPluginTree,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
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

{ #category : #adding }
PyramidPluginTree >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabLeft addItem: [ :builder | builder makeTab: self view presenter label: 'Tree' icon: (self iconNamed: #catalog) order: 1 ]
]

{ #category : #'as yet unclassified' }
PyramidPluginTree >> buildViewFrom: aPyramidGlobalViewBuilder [

	aPyramidGlobalViewBuilder model leftTabs add: self view
]

{ #category : #'as yet unclassified' }
PyramidPluginTree >> connectOn: aPyramidEditor [

	self view presenter activeProject: aPyramidEditor activeProject.
	aPyramidEditor commandPipeline addObserver: self view presenter 
]

{ #category : #initialization }
PyramidPluginTree >> initialize [
	self initializeView
]

{ #category : #initialization }
PyramidPluginTree >> initializeView [

	view := PyramidTab new
		        title: 'Tree';
		        icon: (self iconNamed: #catalog);
		        presenter: PyramidTreeView new;
		        yourself
]

{ #category : #initialization }
PyramidPluginTree >> view [

	^ view
]
