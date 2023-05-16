Class {
	#name : #PyramidPluginCentral,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'spaceView',
		'buttonWindowProperty',
		'buttonWindowPropertyPopover'
	],
	#category : #'NeoPyramid-plugin-central'
}

{ #category : #initialization }
PyramidPluginCentral class >> initialize [

	PyramidPluginManager uniqueInstance addPlugin: self
]

{ #category : #adding }
PyramidPluginCentral >> addPanelsOn: aPyramidSimpleWindow [

	| buttonTesting2 buttonTesting3 |
	
	buttonTesting2 := SpButtonPresenter new
		                  icon: (self iconNamed: #abstract);
		                  yourself.
	buttonTesting3 := SpButtonPresenter new
		                  icon: (self iconNamed: #abstract);
		                  yourself.

	aPyramidSimpleWindow
		at: #space
		addItem: [ :builder | builder makePresenter: self spaceView ].
	aPyramidSimpleWindow at: #spaceToolbarLeft addItem: [ :builder |
		builder makeButtonWithIcon: self buttonWindowProperty order: 1 ].
	aPyramidSimpleWindow
		at: #spaceToolbarCenter
		addItem: [ :builder |
		builder makeButtonWithIcon: buttonTesting2 order: 1 ].
	aPyramidSimpleWindow
		at: #spaceToolbarRight
		addItem: [ :builder |
		builder makeButtonWithIcon: buttonTesting3 order: 1 ]
]

{ #category : #accessing }
PyramidPluginCentral >> buttonWindowProperty [
^ buttonWindowProperty
]

{ #category : #accessing }
PyramidPluginCentral >> buttonWindowPropertyPopover [
^ buttonWindowPropertyPopover
]

{ #category : #'as yet unclassified' }
PyramidPluginCentral >> connectOn: aPyramidEditor [

	self spaceView editor: aPyramidEditor.
]

{ #category : #initialization }
PyramidPluginCentral >> initialize [

	spaceView := PyramidSpaceView new.
	self initializeLayers.
	self inspect
]

{ #category : #initialization }
PyramidPluginCentral >> initializeLayers [

	| layer presenter |
	layer := PyramidBlocWindowForLayoutLayer new.
	presenter := PyramidBlocWindowForLayoutPresenter new layer: layer; yourself.
	self spaceView builder addLayer: layer.
	buttonWindowProperty := SpButtonPresenter new
		                        icon: (self iconNamed: #add);
		                        action: [
			                        self buttonWindowPropertyPopover popup ];
		                        yourself.
	buttonWindowPropertyPopover := PyramidPopoverFactory
		                               makeWithPresenter: presenter
		                               relativeTo: self buttonWindowProperty
		                               position: SpPopoverPosition top
]

{ #category : #accessing }
PyramidPluginCentral >> spaceView [

	^ spaceView
]
