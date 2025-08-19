"
This class define the shortcut to delete a selected element in the space.

it use the plugin-navigation in this package.
"
Class {
	#name : #PyramidSpecShortcutRemoveElement,
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
PyramidSpecShortcutRemoveElement >> defaultKeyCombination [
	"Delete (ENG) and SUPPR (FR) to activate this shortcut"

	keyCombination := KeyboardKey delete
]

{ #category : #initialization }
PyramidSpecShortcutRemoveElement >> initialize [

	self defaultKeyCombination
]

{ #category : #'accessing - classes' }
PyramidSpecShortcutRemoveElement >> pluginFromPyramid: aPyramidEditor [
	
	| listOfPlugins pluginSorted |
	
	listOfPlugins := aPyramidEditor plugins.
	pluginSorted := listOfPlugins select: [ :extensions | extensions isKindOf: PyramidNavigationPlugin ].
	pluginSorted size = 1
	ifFalse: [^ self].
	plugin := pluginSorted asArray first
]

{ #category : #accessing }
PyramidSpecShortcutRemoveElement >> shortcutAction [

	shortcutAction := PyramidSpecShortcutActionObject new.
	^ shortcutAction
		  shortcut: keyCombination;
		  action: [
			  plugin
				  ifNil: [ self inform: 'Plugin navigation is not installed' ]
				  ifNotNil: [ plugin removeSelectedElements ] ]
]
