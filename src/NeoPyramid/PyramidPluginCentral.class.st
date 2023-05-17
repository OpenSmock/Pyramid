Class {
	#name : #PyramidPluginCentral,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'spaceView',
		'buttonWindowProperty'
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
		at: #space
		addItem: [ :builder | builder makePresenter: self spaceView ].

	self spaceView builder layers do: [ :layer |
		layer addPanelsOn: aPyramidSimpleWindow ]
]

{ #category : #'as yet unclassified' }
PyramidPluginCentral >> connectOn: aPyramidEditor [

	self spaceView editor: aPyramidEditor.

	self spaceView builder layers do: [ :layer |
		layer connectOn: aPyramidEditor ]
]

{ #category : #initialization }
PyramidPluginCentral >> initialize [

	spaceView := PyramidSpaceView new.
	self initializeLayers
]

{ #category : #initialization }
PyramidPluginCentral >> initializeLayers [

self spaceView builder addLayer: PyramidControlMoveLayer new.
	self spaceView builder addLayer: PyramidBlocWindowForLayoutLayer new.
	
]

{ #category : #accessing }
PyramidPluginCentral >> spaceView [

	^ spaceView
]
