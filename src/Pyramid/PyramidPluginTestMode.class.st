Class {
	#name : #PyramidPluginTestMode,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'button',
		'spacePlugin'
	],
	#category : #'Pyramid-plugin-testmode'
}

{ #category : #adding }
PyramidPluginTestMode >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow
		at: #topRight
		addItem: [ :builder |
		builder makeButtonWithIcon: self button order: 0 ].
]

{ #category : #actions }
PyramidPluginTestMode >> button [ 

	^ button
]

{ #category : #connecting }
PyramidPluginTestMode >> connectOn: aPyramidEditor [

	spacePlugin := aPyramidEditor plugins detect:[:p | p isKindOf: PyramidSpacePlugin ] ifNone:[ ].
	
]

{ #category : #actions }
PyramidPluginTestMode >> initialize [ 

	button := SpButtonPresenter new
		              icon: (self iconNamed: #glamorousPlay);
		              action: [self switchToTestMode];
						 "enabled: false;"
		              help: 'Switch to test mode';
		              yourself.
]

{ #category : #actions }
PyramidPluginTestMode >> switchToTestMode [

	| element |
	element := (spacePlugin builder overlays at: #events) element.
	self flag:'labordep: can disable element events here? how to connect standard events?'.
]
