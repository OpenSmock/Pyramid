Class {
	#name : 'PyramidToploThemePlugin',
	#superclass : 'Object',
	#traits : 'TPyramidPlugin + TPyramidElementToAdd',
	#classTraits : 'TPyramidPlugin classTrait + TPyramidElementToAdd classTrait',
	#instVars : [
		'themePresenter',
		'themePropertyManager'
	],
	#category : 'Pyramid-Toplo-plugin-theme-management',
	#package : 'Pyramid-Toplo',
	#tag : 'plugin-theme-management'
}

{ #category : 'adding' }
PyramidToploThemePlugin class >> addOnLibrary: aLibrary [

	| classes factories |
	classes := ToElement allSubclasses.
	factories := classes
		             reject: [ :each | each isAbstract ]
		             thenCollect: [ :class |
			             PyramidElementToAddFactory new
				             elementIcon:
					             (Smalltalk ui icons iconNamed: class systemIconName);
				             elementName: class name;
				             elementBlock: [ { class new } ];
				             yourself ].

	aLibrary
		addCategoryWithName: 'Toplo'
		withIcon: (Smalltalk ui icons iconNamed: #smallInfo)
		withAllFactories: factories asArray sorted.
]

{ #category : 'asserting' }
PyramidToploThemePlugin class >> shouldInstall [

	^ false
]

{ #category : 'adding' }
PyramidToploThemePlugin >> addPanelsOn: aPyramidSimpleWindow [

	aPyramidSimpleWindow at: #tabRight addItem: [ :builder |
		builder
			makeTab: self themePresenter
			label: 'Toplo-Theme'
			icon: (Smalltalk ui icons iconNamed: #smallPushpin)
			order: 1 ]
]

{ #category : 'actions' }
PyramidToploThemePlugin >> configureBuilder: aPyramidEditorBuilder [

	| spacePlugin |
	spacePlugin := aPyramidEditorBuilder findPlugin: #PyramidSpacePlugin.
	self themePresenter pyramidSpaceBuilderConfigurationOn: spacePlugin builder
]

{ #category : 'connecting' }
PyramidToploThemePlugin >> connectOn: aPyramidEditor [

	self themePresenter editor: aPyramidEditor.
	self themePropertyManager projectModel: aPyramidEditor projectModel 
]

{ #category : 'initialization' }
PyramidToploThemePlugin >> initialize [

	themePresenter := PyramidThemePresenter new.
	themePropertyManager := PyramidPropertiesManagerForSelection new
		                        presenterStrategy:
			                        PyramidThemePropertyStrategy new;
		                        yourself.
	themePresenter styleSheetEditor stampPresenter: themePropertyManager presenter
]

{ #category : 'accessing' }
PyramidToploThemePlugin >> themePresenter [

	^ themePresenter
]

{ #category : 'accessing' }
PyramidToploThemePlugin >> themePropertyManager [

	^ themePropertyManager
]
