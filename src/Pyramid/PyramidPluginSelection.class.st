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

{ #category : #adding }
PyramidPluginSelection >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabRight addItem: [ :builder |
		builder
			makeTab: self view
			label: 'Playground'
			icon: (self iconNamed: #open)
			order: 1 ].
]

{ #category : #connecting }
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
