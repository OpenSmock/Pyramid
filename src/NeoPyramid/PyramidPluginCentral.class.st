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

	aPyramidSimpleWindow
		at: #space
		addItem: [ :builder | builder makePresenter: self spaceView ].

	aPyramidSimpleWindow at: #spaceToolbarBottom addItem: [ :builder |
		builder makeButtonWithIcon: self buttonWindowProperty order: 1 ].
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
	self initializeLayers
]

{ #category : #initialization }
PyramidPluginCentral >> initializeLayers [

	| layer presenter |
	layer := PyramidBlocWindowForLayoutLayer new.
	presenter := PyramidBlocWindowForLayoutPresenter new
		             layer: layer;
		             yourself.
	self spaceView builder addLayer: layer.
	buttonWindowProperty := SpButtonPresenter new
		                        icon: (self iconNamed: #window);
		                        action: [
			                        (PyramidPopoverFactory
				                         makeWithPresenter: presenter
				                         relativeTo: self buttonWindowProperty
				                         position: SpPopoverPosition right) popup ];
		                        yourself.
	buttonWindowPropertyPopover := PyramidPopoverFactory
		                               makeWithPresenter: presenter
		                               relativeTo: self buttonWindowProperty
		                               position: SpPopoverPosition right
]

{ #category : #accessing }
PyramidPluginCentral >> spaceView [

	^ spaceView
]
