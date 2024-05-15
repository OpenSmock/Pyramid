Class {
	#name : 'PyramidPluginPlayground',
	#superclass : 'Object',
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'activeProject',
		'view'
	],
	#category : 'Pyramid-plugin-playground',
	#package : 'Pyramid',
	#tag : 'plugin-playground'
}

{ #category : 'adding' }
PyramidPluginPlayground >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabRight addItem: [ :builder |
		builder
			makeTab: self view
			label: 'Playground'
			icon: (self iconNamed: #open)
			order: 100 ]
]

{ #category : 'connecting' }
PyramidPluginPlayground >> connectOn: aPyramidEditor [

	self view projectModel: aPyramidEditor projectModel
]

{ #category : 'initialization' }
PyramidPluginPlayground >> initialize [

	view := PyramidPlaygroundView new
]

{ #category : 'initialization' }
PyramidPluginPlayground >> view [

	^ view
]
