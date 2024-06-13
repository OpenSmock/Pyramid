Class {
	#name : 'PyramidPluginSettingsAccess',
	#superclass : 'Object',
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'settingsButton'
	],
	#category : 'Pyramid-IDE-plugin-settings',
	#package : 'Pyramid-IDE',
	#tag : 'plugin-settings'
}

{ #category : 'adding' }
PyramidPluginSettingsAccess >> addPanelsOn: aPyramidWindow [

	aPyramidWindow at: #topLeft addItem: [ :builder |
		builder makeButtonWithIcon: self settingsButton order: 3 ]
]

{ #category : 'initialization' }
PyramidPluginSettingsAccess >> initialize [

	settingsButton := SpButtonPresenter new
		                  icon: (Smalltalk ui icons iconNamed: #smallConfiguration);
		                  action: [ PyramidWorld openPyramidSettings ];
		                  help: self settingsButtonHelp;
		                  yourself
]

{ #category : 'initialization' }
PyramidPluginSettingsAccess >> settingsButton [

	^ settingsButton
]

{ #category : 'initialization' }
PyramidPluginSettingsAccess >> settingsButtonHelp [

	^ 'Open the settings menu for Pyramid.'
]
