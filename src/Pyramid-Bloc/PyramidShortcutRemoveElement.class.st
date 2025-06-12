"
This class define the shortcut to delete a selected element in the space.
"
Class {
	#name : #PyramidShortcutRemoveElement,
	#superclass : #PyramidSpaceShortcutManagerPlugin,
	#instVars : [
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

{ #category : #removing }
PyramidShortcutRemoveElement >> navigationPluginForRemoveElementFromPyramid: aPyramidEditor [

	| removeElementPluginList |
	removeElementPluginList := aPyramidEditor plugins select: [ :plugin | plugin isKindOf: PyramidNavigationPlugin ].
	removeElementPluginList size = 1
	ifFalse: [^ self].
	removeElementPluginList do: [ :plug | navigationPlugin := plug ].
]

{ #category : #accessing }
PyramidShortcutRemoveElement >> shortcutActionRemoveElement [

	^ shortcutActionRemoveElement := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut Paste';
			              combination: keyCombinationRemoveElement;
			              action: [ :event | 	navigationPlugin removeSelectedElements ]
]
