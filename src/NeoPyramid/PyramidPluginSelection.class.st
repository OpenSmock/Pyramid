Class {
	#name : #PyramidPluginSelection,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'activeProject',
		'view'
	],
	#category : #'NeoPyramid-plugin-selection'
}

{ #category : #'as yet unclassified' }
PyramidPluginSelection class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #'as yet unclassified' }
PyramidPluginSelection >> buildViewFrom: aPyramidGlobalViewBuilder [

	aPyramidGlobalViewBuilder model rightTabs add: self view
]

{ #category : #'as yet unclassified' }
PyramidPluginSelection >> connectOn: aPyramidEditor [

	self view presenter activeProject: aPyramidEditor activeProject
]

{ #category : #initialization }
PyramidPluginSelection >> initialize [
	self initializeView
]

{ #category : #initialization }
PyramidPluginSelection >> initializeView [

	view := PyramidTab new
		        title: 'Playground';
		        icon: (self iconNamed: #open);
		        presenter: PyramidSelectionView new;
		        yourself
]

{ #category : #initialization }
PyramidPluginSelection >> view [

	^ view
]
