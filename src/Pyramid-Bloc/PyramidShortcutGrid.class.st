"
This class define the shortcut to show or hide the grid on the space.
"
Class {
	#name : #PyramidShortcutGrid,
	#superclass : #PyramidSpaceShortcutManagerPlugin,
	#instVars : [
		'shortcutGridVisibility',
		'keyCombinationGridVisibility'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #accessing }
PyramidShortcutGrid >> defaultKeyCombinationGridVisibility [
	"CTRL + G to activate this shortcut"
	keyCombinationGridVisibility := ((BlKeyCombination builder key: KeyboardKey controlLeft; key: KeyboardKey G) build)
]

{ #category : #'as yet unclassified' }
PyramidShortcutGrid >> gridFeatureFromSpacePlugin: aPyramidEditor [

	| spacePluginList listOfSpaceExtension pyramidMainExtensionSet pyramidMainExtension |
	
	spacePluginList := aPyramidEditor plugins select: [ :plugin | plugin isKindOf: PyramidSpacePlugin ].
	spacePluginList size = 1
	ifFalse: [^ self].
	
	spacePluginList do: [ :plug | spacePlugin := plug ].
	listOfSpaceExtension := spacePlugin builder extensions.
	pyramidMainExtensionSet := listOfSpaceExtension select: [ :extensions | extensions isKindOf: PyramidMainExtension ].
	pyramidMainExtensionSet size = 1
	ifFalse: [^ self].
	
	pyramidMainExtensionSet do: [ :extension | pyramidMainExtension := extension ].
	gridFeature := pyramidMainExtension.
	
]

{ #category : #initialization }
PyramidShortcutGrid >> initialize [ 
	
	self defaultKeyCombinationGridVisibility 
]

{ #category : #accessing }
PyramidShortcutGrid >> keyCombinationGridVisibility: aKeyCombination [
	
	keyCombinationGridVisibility := aKeyCombination
]

{ #category : #accessing }
PyramidShortcutGrid >> shortcutActionGridVisibility [

	^ shortcutGridVisibility := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut grid visibility';
			              combination: keyCombinationGridVisibility;
			              action: [ :event | 	gridFeature workplacePropertiesView visibilityButton toggleState ]
]
