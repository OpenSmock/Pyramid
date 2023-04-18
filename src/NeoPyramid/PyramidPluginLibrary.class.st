Class {
	#name : #PyramidPluginLibrary,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'spaceView',
		'addButton'
	],
	#category : #'NeoPyramid-plugin-adders'
}

{ #category : #'as yet unclassified' }
PyramidPluginLibrary class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #accessing }
PyramidPluginLibrary >> addButton [

	^ addButton
]

{ #category : #'as yet unclassified' }
PyramidPluginLibrary >> buildViewFrom: aPyramidGlobalViewBuilder [

	aPyramidGlobalViewBuilder model tools add: self addButton
]

{ #category : #'as yet unclassified' }
PyramidPluginLibrary >> connectOn: aPyramidEditor [

	self addButton presenter editor: aPyramidEditor
]

{ #category : #initialization }
PyramidPluginLibrary >> initialize [

	addButton := PyramidButtonWithPopover new
		             icon: (self iconNamed: #add);
		             presenter: PyramidLibraryView new;
		             alignCenter;
		             yourself
]
