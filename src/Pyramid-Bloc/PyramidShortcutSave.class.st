"
This class used to create shortcut for saving in Pyramid space.

Used the plugin-save in this package.
"
Class {
	#name : #PyramidShortcutSave,
	#superclass : #PyramidSpaceShortcutManagerPlugin,
	#instVars : [
		'shortcutSave',
		'keyCombinationSave'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #initialization }
PyramidShortcutSave >> initialize [ 
	
	"Do nothing"
]

{ #category : #accessing }
PyramidShortcutSave >> keyCombinationSave [
	"CTRL + S to activate this shortcut"
	^ keyCombinationSave ifNil: [
		  keyCombinationSave := ((BlKeyCombination builder key: KeyboardKey controlLeft; key: KeyboardKey S) build) ]
]

{ #category : #accessing }
PyramidShortcutSave >> keyCombinationSave: aKeyCombination [
	
	^ keyCombinationSave := aKeyCombination
]

{ #category : #'as yet unclassified' }
PyramidShortcutSave >> savePluginFromPyramid: aPyramidEditor [

	| savePluginList |
	savePluginList := aPyramidEditor plugins select: [ :plugin | plugin isKindOf: PyramidSavePlugin ].
	savePluginList size = 1
	ifFalse: [^ self].
	savePluginList do: [ :plug | savePlugin := plug ].
]

{ #category : #accessing }
PyramidShortcutSave >> shortcutActionSave [

	^ shortcutSave ifNil: [
		  shortcutSave := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut Paste';
			              combination: self keyCombinationSave;
			              action: [ :event | savePlugin saveAction. ] ]
]
