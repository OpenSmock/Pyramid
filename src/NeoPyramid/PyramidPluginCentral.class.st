Class {
	#name : #PyramidPluginCentral,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'spaceView'
	],
	#category : #'NeoPyramid-plugin-central'
}

{ #category : #initialization }
PyramidPluginCentral class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #adding }
PyramidPluginCentral >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow
		at: #center
		addItem: [ :builder |
		builder makePresenter: self spaceView ]
]

{ #category : #'as yet unclassified' }
PyramidPluginCentral >> connectOn: aPyramidEditor [

	self spaceView editor: aPyramidEditor
]

{ #category : #initialization }
PyramidPluginCentral >> initialize [

	spaceView := PyramidSpaceView new
]

{ #category : #accessing }
PyramidPluginCentral >> spaceView [

	^ spaceView
]
