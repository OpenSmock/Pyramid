"
This class define the shortcut to show or hide the grid on the space.

the grid is define in the plugin-space-extension -> PyramidMainExtension
"
Class {
	#name : #PyramidSpaceShortcutGrid,
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
PyramidSpaceShortcutGrid >> defaultKeyCombinationGridVisibility [
	"CTRL + G to activate this shortcut"
	keyCombinationGridVisibility := ((BlKeyCombination builder primary key: KeyboardKey G) build)
]

{ #category : #'accessing - classes' }
PyramidSpaceShortcutGrid >> gridFeatureFromSpacePlugin: aPyramidEditor [

	| spacePlugin listOfSpaceExtension pyramidMainExtensionSet |
	
	spacePlugin := aPyramidEditor findPlugin: PyramidSpacePlugin.
	
	listOfSpaceExtension := spacePlugin builder extensions.
	
	pyramidMainExtensionSet := listOfSpaceExtension select: [ :extensions | extensions isKindOf: PyramidMainExtension ].
	pyramidMainExtensionSet size = 1
	ifFalse: [^ self].
	gridFeature := pyramidMainExtensionSet asArray first
	
]

{ #category : #initialization }
PyramidSpaceShortcutGrid >> initialize [ 
	
	self defaultKeyCombinationGridVisibility.
]

{ #category : #accessing }
PyramidSpaceShortcutGrid >> keyCombinationGridVisibility: aKeyCombination [
	
	keyCombinationGridVisibility := aKeyCombination
]

{ #category : #accessing }
PyramidSpaceShortcutGrid >> shortcutActionGridVisibility [

	^ shortcutGridVisibility := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut grid visibility';
			              combination: keyCombinationGridVisibility;
			              action: [ :event | 	gridFeature workplacePropertiesView visibilityButton toggleState ].
]
