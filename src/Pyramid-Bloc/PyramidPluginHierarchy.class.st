Class {
	#name : #PyramidPluginHierarchy,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'activeProject',
		'view'
	],
	#category : #'Pyramid-Bloc-plugin-hierarchy'
}

{ #category : #initialization }
PyramidPluginHierarchy class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #adding }
PyramidPluginHierarchy >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabLeft addItem: [ :builder |
		builder
			makeTab: self view
			label: 'Tree'
			icon: (self iconNamed: #catalog)
			order: 1 ]
]

{ #category : #'as yet unclassified' }
PyramidPluginHierarchy >> connectOn: aPyramidEditor [

	self view connectOn: aPyramidEditor.
	
]

{ #category : #initialization }
PyramidPluginHierarchy >> initialize [

	view := PyramidHierarchyPresenter new
]

{ #category : #initialization }
PyramidPluginHierarchy >> view [

	^ view
]
