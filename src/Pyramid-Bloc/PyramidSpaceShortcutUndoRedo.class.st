"
Class use to create the shortcut undo / redo.

Use the history feature from the package Pyramid.
"
Class {
	#name : #PyramidSpaceShortcutUndoRedo,
	#superclass : #PyramidSpaceShortcutManagerPlugin,
	#instVars : [
		'historyPlugin',
		'shortcutUndo',
		'keyCombinationUndo',
		'shortcutRedo',
		'keyCombinationRedo'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #accessing }
PyramidSpaceShortcutUndoRedo >> defaultKeyCombinationRedo [
	"CTRL + Y to activate this shortcut"
	keyCombinationRedo := ((BlKeyCombination builder primary key: KeyboardKey Y) build)
]

{ #category : #accessing }
PyramidSpaceShortcutUndoRedo >> defaultKeyCombinationUndo [
	"CTRL + Z to activate this shortcut"
	keyCombinationUndo := ((BlKeyCombination builder primary key: KeyboardKey Z) build)
]

{ #category : #'accessing - classes' }
PyramidSpaceShortcutUndoRedo >> historyPluginFromPyramid: aPyramidEditor [

	historyPlugin := aPyramidEditor findPlugin: PyramidHistoryPlugin.
]

{ #category : #initialization }
PyramidSpaceShortcutUndoRedo >> initialize [ 
	
	self defaultKeyCombinationRedo.
	self defaultKeyCombinationUndo.
]

{ #category : #accessing }
PyramidSpaceShortcutUndoRedo >> keyCombinationRedo: aNewKeyCombination [

	^ keyCombinationRedo := aNewKeyCombination
]

{ #category : #accessing }
PyramidSpaceShortcutUndoRedo >> keyCombinationUndo: aNewKeyCombination [

	^ keyCombinationUndo := aNewKeyCombination
]

{ #category : #accessing }
PyramidSpaceShortcutUndoRedo >> shortcutActionRedo [

	^ shortcutRedo := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut redo';
			              combination: keyCombinationRedo;
			              action: [ :event | historyPlugin 
														ifNil: [ self inform: 'Plugin undo/redo is not installed' ]
														ifNotNil: [ historyPlugin history redo. 
																		historyPlugin projectModel informElementsChanged ] ]
]

{ #category : #accessing }
PyramidSpaceShortcutUndoRedo >> shortcutActionUndo [

	^ shortcutUndo := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut undo';
			              combination: keyCombinationUndo;
			              action: [ :event | historyPlugin 
														ifNil: [ self inform: 'Plugin undo/redo is not installed' ]
														ifNotNil: [ historyPlugin history undo. 
																		historyPlugin projectModel informElementsChanged ] ]
]
