"
This class define the shortcut to delete a selected element in the space.

it use the plugin-navigation in this package.
"
Class {
	#name : #PyramidShortcutRemoveElement,
	#superclass : #PyramidSpaceShortcutManagerPlugin,
	#instVars : [
		'navigationPlugin',
		'shortcutActionRemoveElement',
		'keyCombinationRemoveElement'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #accessing }
PyramidShortcutRemoveElement >> defaultKeyCombinationRemoveElement [
	"suppr / del to activate this shortcut"
	keyCombinationRemoveElement := ((BlKeyCombination builder key: KeyboardKey delete) build)
]

{ #category : #initialization }
PyramidShortcutRemoveElement >> initialize [ 
	
	self defaultKeyCombinationRemoveElement 
]

{ #category : #accessing }
PyramidShortcutRemoveElement >> keyCombinationRemoveElement: aKeyCombination [
	
	keyCombinationRemoveElement := aKeyCombination
]

{ #category : #'accessing - classes' }
PyramidShortcutRemoveElement >> navigationPluginFromPyramid: aPyramidEditor [

	| removeElementPluginList |
	removeElementPluginList := aPyramidEditor plugins select: [ :plugin | plugin isKindOf: PyramidNavigationPlugin ].
	removeElementPluginList size = 1
	ifFalse: [^ self].
	navigationPlugin := removeElementPluginList asArray first
]

{ #category : #accessing }
PyramidShortcutRemoveElement >> shortcutActionRemoveElement [

	^ shortcutActionRemoveElement := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut remove selected element';
			              combination: keyCombinationRemoveElement;
			              action: [ :event | navigationPlugin ifNil: [ self inform: 'Plugin navigation is not installed' ]
																			 ifNotNil: [ navigationPlugin removeSelectedElements ] ]
]
