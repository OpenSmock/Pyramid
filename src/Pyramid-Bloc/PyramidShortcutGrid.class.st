"
This class define the shortcut to show or hide the grid on the space.

the grid is define in the plugin-space-extension -> PyramidMainExtension
"
Class {
	#name : #PyramidShortcutGrid,
	#superclass : #PyramidSpaceShortcutManagerPlugin,
	#instVars : [
		'gridFeature',
		'shortcutGridVisibility',
		'keyCombinationGridVisibility',
		'keyCombinationTest',
		'shortcutTest'
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

	| spacePlugin spacePluginSet listOfSpaceExtension pyramidMainExtensionSet |
	
	spacePluginSet := aPyramidEditor plugins select: [ :plugin | plugin isKindOf: PyramidSpacePlugin ].
	spacePluginSet size = 1
	ifFalse: [^ self].
	spacePlugin := spacePluginSet asArray first.
	
	listOfSpaceExtension := spacePlugin builder extensions.
	
	pyramidMainExtensionSet := listOfSpaceExtension select: [ :extensions | extensions isKindOf: PyramidMainExtension ].
	pyramidMainExtensionSet size = 1
	ifFalse: [^ self].
	gridFeature := pyramidMainExtensionSet asArray first
	
]

{ #category : #initialization }
PyramidShortcutGrid >> initialize [ 
	
	self defaultKeyCombinationGridVisibility.
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
			              action: [ :event | 	gridFeature workplacePropertiesView visibilityButton toggleState ].
]
