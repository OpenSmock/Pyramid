Class {
	#name : #PyramidPluginProperties,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'view'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #initialization }
PyramidPluginProperties class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #adding }
PyramidPluginProperties >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabRight addItem: [ :builder |
		builder
			makeTab: self view
			label: 'Properties'
			icon: (self iconNamed: #edit)
			order: 1 ]
]

{ #category : #'as yet unclassified' }
PyramidPluginProperties >> connectOn: aPyramidEditor [

	self view activeProject: aPyramidEditor activeProject.
	self view pipeline: aPyramidEditor commandPipeline.

	self view addProperty: PyramidProperty identifier.
	self view addProperty: PyramidProperty visibility.
	self view addProperty: PyramidProperty background.
	self view addProperty: PyramidProperty text
]

{ #category : #'as yet unclassified' }
PyramidPluginProperties >> initialize [

	view := PyramidPropertiesView new
]

{ #category : #accessing }
PyramidPluginProperties >> view [
^ view
]
