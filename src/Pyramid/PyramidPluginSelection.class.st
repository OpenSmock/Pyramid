Class {
	#name : #PyramidPluginSelection,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'activeProject',
		'view'
	],
	#category : #'Pyramid-plugin-selection'
}

{ #category : #'as yet unclassified' }
PyramidPluginSelection class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #adding }
PyramidPluginSelection >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabRight addItem: [ :builder |
		builder
			makeTab: self view
			label: 'Playground'
			icon: (self iconNamed: #open)
			order: 1 ].
]

{ #category : #'as yet unclassified' }
PyramidPluginSelection >> connectOn: aPyramidEditor [

	self view projectModel: aPyramidEditor projectModel
]

{ #category : #initialization }
PyramidPluginSelection >> initialize [

	view := PyramidSelectionView new
]

{ #category : #initialization }
PyramidPluginSelection >> view [

	^ view
]
