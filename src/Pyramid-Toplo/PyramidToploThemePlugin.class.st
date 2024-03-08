Class {
	#name : #PyramidToploThemePlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'themePresenter',
		'themePropertyManager'
	],
	#category : #'Pyramid-Toplo-plugin-theme-management'
}

{ #category : #adding }
PyramidToploThemePlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabRight addItem: [ :builder |
		builder
			makeTab: self themePresenter
			label: 'Toplo-Theme'
			icon: (self iconNamed: #smallPushpin)
			order: 1 ]
]

{ #category : #actions }
PyramidToploThemePlugin >> configureBuilder: aPyramidEditorBuilder [

	| spacePlugin |
	spacePlugin := aPyramidEditorBuilder findPlugin: #PyramidSpacePlugin.
	self themePresenter pyramidSpaceBuilderConfigurationOn: spacePlugin builder
]

{ #category : #connecting }
PyramidToploThemePlugin >> connectOn: aPyramidEditor [

	self themePresenter editor: aPyramidEditor.
	self themePropertyManager projectModel: aPyramidEditor projectModel 
]

{ #category : #initialization }
PyramidToploThemePlugin >> initialize [

	themePresenter := PyramidThemePresenter new.
	themePropertyManager := PyramidPropertiesManagerForSelection new
		                        presenterStrategy:
			                        PyramidThemePropertyStrategy new;
		                        yourself.
	themePresenter styleSheetEditor stampPresenter: themePropertyManager presenter
]

{ #category : #accessing }
PyramidToploThemePlugin >> themePresenter [

	^ themePresenter
]

{ #category : #accessing }
PyramidToploThemePlugin >> themePropertyManager [

	^ themePropertyManager
]
