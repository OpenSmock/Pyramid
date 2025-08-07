"
This class define the shortcut to show or hide the grid on the space.

the grid is define in the plugin-space-extension -> PyramidMainExtension
"
Class {
	#name : #PyramidSpecShortcutGrid,
	#superclass : #PyramidSpecShortcutManagerPlugin,
	#traits : 'TPyramidShortcutSpec',
	#classTraits : 'TPyramidShortcutSpec classTrait',
	#instVars : [
		'plugin',
		'keyCombination',
		'shortcutAction'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #accessing }
PyramidSpecShortcutGrid >> defaultKeyCombination [
	"CTRL + G to activate this shortcut"

	keyCombination := $g command mac | $g control unix | $g control win
]

{ #category : #initialization }
PyramidSpecShortcutGrid >> initialize [

	self defaultKeyCombination
]

{ #category : #'accessing - classes' }
PyramidSpecShortcutGrid >> pluginFromPyramid: aPyramidEditor [

	| spacePlugin extensionList extensionSorted listOfPlugins pluginSorted |
	
	listOfPlugins := aPyramidEditor plugins.
	pluginSorted := listOfPlugins select: [ :extensions | extensions isKindOf: PyramidSpacePlugin ].
	pluginSorted size = 1
	ifFalse: [^ self].
	spacePlugin := pluginSorted asArray first.

	extensionList := spacePlugin builder extensions.

	extensionSorted := extensionList select: [ :extensions |
		                           extensions isKindOf: PyramidMainExtension ].
	extensionSorted size = 1 ifFalse: [ ^ self ].
	plugin := extensionSorted asArray first
]

{ #category : #accessing }
PyramidSpecShortcutGrid >> shortcutAction [

	shortcutAction := PyramidSpecShortcutActionObject new.
	^ shortcutAction
		  shortcut: keyCombination;
		  action: [
			  plugin workplacePropertiesView visibilityButton toggleState ]
]
