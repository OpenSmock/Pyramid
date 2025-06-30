"
Class use to create the shortcut undo / redo.

Use the history feature from the package Pyramid.
"
Class {
	#name : #PyramidShortcutUndoRedo,
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
PyramidShortcutUndoRedo >> defaultKeyCombinationRedo [
	"CTRL + Y to activate this shortcut"
	keyCombinationRedo := ((BlKeyCombination builder primary key: KeyboardKey Y) build)
]

{ #category : #accessing }
PyramidShortcutUndoRedo >> defaultKeyCombinationUndo [
	"CTRL + Z to activate this shortcut"
	keyCombinationUndo := ((BlKeyCombination builder primary key: KeyboardKey Z) build)
]

{ #category : #'as yet unclassified' }
PyramidShortcutUndoRedo >> historyPluginFromPyramid: aPyramidEditor [

	| historyPluginList |
	historyPluginList := aPyramidEditor plugins select: [ :plugin | plugin isKindOf: PyramidHistoryPlugin ].
	historyPluginList size = 1
	ifFalse: [^ self].
	historyPlugin := historyPluginList asArray first. 
]

{ #category : #initialization }
PyramidShortcutUndoRedo >> initialize [ 
	
	self defaultKeyCombinationRedo.
	self defaultKeyCombinationUndo.
]

{ #category : #accessing }
PyramidShortcutUndoRedo >> keyCombinationRedo: aNewKeyCombination [

	^ keyCombinationRedo := aNewKeyCombination
]

{ #category : #accessing }
PyramidShortcutUndoRedo >> keyCombinationUndo: aNewKeyCombination [

	^ keyCombinationUndo := aNewKeyCombination
]

{ #category : #accessing }
PyramidShortcutUndoRedo >> shortcutActionRedo [

	^ shortcutRedo := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut redo';
			              combination: keyCombinationRedo;
			              action: [ :event | historyPlugin 
														ifNil: [ self inform: 'Plugin undo/redo is not installed' ]
														ifNotNil: [ historyPlugin history redo. 
																		historyPlugin projectModel informElementsChanged ] ]
]

{ #category : #accessing }
PyramidShortcutUndoRedo >> shortcutActionUndo [

	^ shortcutUndo := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut undo';
			              combination: keyCombinationUndo;
			              action: [ :event | historyPlugin 
														ifNil: [ self inform: 'Plugin undo/redo is not installed' ]
														ifNotNil: [ historyPlugin history undo. 
																		historyPlugin projectModel informElementsChanged ] ]
]
