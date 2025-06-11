Class {
	#name : #PyramidShortcutRemoveElement,
	#superclass : #PyramidSpaceShortcutManagerPlugin,
	#instVars : [
		'shortcutActionRemoveElement',
		'keyCombinationRemoveElement'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #initialization }
PyramidShortcutRemoveElement >> initialize [ 
	
	"Do nothing"PyramidNavigationPlugin
]

{ #category : #accessing }
PyramidShortcutRemoveElement >> keyCombinationRemoveElement [
	"suppr / del to activate this shortcut"
	^ keyCombinationRemoveElement ifNil: [
		  keyCombinationRemoveElement := ((BlKeyCombination builder key: KeyboardKey delete) build) ]
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

	^ shortcutActionRemoveElement ifNil: [
		  shortcutActionRemoveElement := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut Paste';
			              combination: self keyCombinationRemoveElement;
			              action: [ :event | 	navigationPlugin removeSelectedElements ] ]
]
