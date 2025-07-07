"
This class define the shortcut to delete a selected element in the space.

it use the plugin-navigation in this package.
"
Class {
	#name : #PyramidSpaceShortcutRemoveElement,
	#superclass : #PyramidSpaceShortcutManagerPlugin,
	#instVars : [
		'navigationPlugin',
		'shortcutActionRemoveElement',
		'keyCombinationRemoveElement'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #accessing }
PyramidSpaceShortcutRemoveElement >> defaultKeyCombinationRemoveElement [
	"suppr / del to activate this shortcut"
	keyCombinationRemoveElement := ((BlKeyCombination builder key: KeyboardKey delete) build)
]

{ #category : #initialization }
PyramidSpaceShortcutRemoveElement >> initialize [ 
	
	self defaultKeyCombinationRemoveElement 
]

{ #category : #accessing }
PyramidSpaceShortcutRemoveElement >> keyCombinationRemoveElement: aKeyCombination [
	
	keyCombinationRemoveElement := aKeyCombination
]

{ #category : #'accessing - classes' }
PyramidSpaceShortcutRemoveElement >> navigationPluginFromPyramid: aPyramidEditor [

	navigationPlugin := aPyramidEditor findPlugin: PyramidNavigationPlugin.
]

{ #category : #accessing }
PyramidSpaceShortcutRemoveElement >> shortcutActionRemoveElement [

	^ shortcutActionRemoveElement := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut remove selected element';
			              combination: keyCombinationRemoveElement;
			              action: [ :event | navigationPlugin ifNil: [ self inform: 'Plugin navigation is not installed' ]
																			 ifNotNil: [ navigationPlugin removeSelectedElements ] ]
]
