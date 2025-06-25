"
This class used to create shortcut for saving in Pyramid space.

Used the plugin-save in this package.
"
Class {
	#name : #PyramidShortcutSave,
	#superclass : #PyramidSpaceShortcutManagerPlugin,
	#instVars : [
		'savePlugin',
		'shortcutSave',
		'keyCombinationSave'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #accessing }
PyramidShortcutSave >> defaultKeyCombinationSave [
	"CTRL + S to activate this shortcut"
	keyCombinationSave := ((BlKeyCombination builder key: KeyboardKey controlLeft; key: KeyboardKey S) build)
]

{ #category : #initialization }
PyramidShortcutSave >> initialize [ 
	
	self defaultKeyCombinationSave
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
	savePlugin := savePluginList asArray first
]

{ #category : #accessing }
PyramidShortcutSave >> shortcutActionSave [

	^ shortcutSave := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut save';
			              combination: keyCombinationSave;
			              action: [ :event | savePlugin
														ifNil: [ self inform: 'Plugin save is not installed' ]
														ifNotNil: [ savePlugin saveAction ] ]
]
