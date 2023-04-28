Class {
	#name : #PyramidPluginProperties,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'propertiesView',
		'propertiesTab'
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
			makeTab: self propertiesView
			label: 'Properties'
			icon: (self iconNamed: #edit)
			order: 1 ]
]

{ #category : #'as yet unclassified' }
PyramidPluginProperties >> buildViewFrom: aPyramidGlobalViewBuilder [

	aPyramidGlobalViewBuilder model rightTabs add: self propertiesTab
]

{ #category : #'as yet unclassified' }
PyramidPluginProperties >> connectOn: aPyramidEditor [

	self propertiesView activeProject: aPyramidEditor activeProject.
	self propertiesView pipeline: aPyramidEditor commandPipeline.

	self propertiesView addProperty: PyramidProperty identifier.
	self propertiesView addProperty: PyramidProperty visibility
]

{ #category : #'as yet unclassified' }
PyramidPluginProperties >> initialize [

	propertiesView := PyramidPropertiesView new.
	propertiesTab := PyramidTab new
		                 presenter: [ propertiesView ];
		                 title: 'Properties';
		                 icon: (self iconNamed: #edit);
		                 yourself
]

{ #category : #'as yet unclassified' }
PyramidPluginProperties >> propertiesTab [

	^ propertiesTab
]

{ #category : #'as yet unclassified' }
PyramidPluginProperties >> propertiesView [

	^ propertiesView
]
