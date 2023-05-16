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

	| buttonTesting1 buttonTesting2 buttonTesting3 |
	buttonTesting1 := SpButtonPresenter new
		                  icon: (self iconNamed: #abstract);
		                  yourself.
	buttonTesting2 := SpButtonPresenter new
		                  icon: (self iconNamed: #abstract);
		                  yourself.
	buttonTesting3 := SpButtonPresenter new
		                  icon: (self iconNamed: #abstract);
		                  yourself.

	aPyramidSimpleWindow
		at: #space
		addItem: [ :builder | builder makePresenter: self spaceView ].
	aPyramidSimpleWindow
		at: #spaceToolbarLeft
		addItem: [ :builder |
		builder makeButtonWithIcon: buttonTesting1 order: 1 ].
	aPyramidSimpleWindow
		at: #spaceToolbarCenter
		addItem: [ :builder |
		builder makeButtonWithIcon: buttonTesting2 order: 1 ].
	aPyramidSimpleWindow
		at: #spaceToolbarRight
		addItem: [ :builder |
		builder makeButtonWithIcon: buttonTesting3 order: 1 ]
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
