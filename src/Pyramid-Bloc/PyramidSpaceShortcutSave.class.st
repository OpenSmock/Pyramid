"
This class used to create shortcut for saving in Pyramid space.

Used the plugin-save in this package.
"
Class {
	#name : #PyramidSpaceShortcutSave,
	#superclass : #PyramidSpaceShortcutManagerPlugin,
	#instVars : [
		'savePlugin',
		'shortcutSave',
		'keyCombinationSave'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #accessing }
PyramidSpaceShortcutSave >> defaultKeyCombinationSave [
	"CTRL + S to activate this shortcut"
	keyCombinationSave := ((BlKeyCombination builder primary key: KeyboardKey S) build)
]

{ #category : #initialization }
PyramidSpaceShortcutSave >> initialize [ 
	
	self defaultKeyCombinationSave
]

{ #category : #accessing }
PyramidSpaceShortcutSave >> keyCombinationSave: aKeyCombination [
	
	^ keyCombinationSave := aKeyCombination
]

{ #category : #'accessing - classes' }
PyramidSpaceShortcutSave >> savePluginFromPyramid: aPyramidEditor [

	savePlugin := aPyramidEditor findPlugin: PyramidSavePlugin.
]

{ #category : #accessing }
PyramidSpaceShortcutSave >> shortcutActionSave [

	^ shortcutSave := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut save';
			              combination: keyCombinationSave;
			              action: [ :event | savePlugin
														ifNil: [ self inform: 'Plugin save is not installed' ]
														ifNotNil: [ savePlugin saveAction ] ]
]
