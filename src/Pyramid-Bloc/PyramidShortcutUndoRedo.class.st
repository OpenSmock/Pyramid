"
Class use to create the shortcut undo / redo.

Use the history feature from the package Pyramid.
"
Class {
	#name : #PyramidShortcutUndoRedo,
	#superclass : #PyramidSpaceShortcutManagerPlugin,
	#instVars : [
		'shortcutUndo',
		'keyCombinationUndo',
		'shortcutRedo',
		'keyCombinationRedo'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #'as yet unclassified' }
PyramidShortcutUndoRedo >> historyPluginFromPyramid: aPyramidEditor [

	| historyPluginList |
	historyPluginList := aPyramidEditor plugins select: [ :plugin | plugin isKindOf: PyramidHistoryPlugin ].
	historyPluginList size = 1
	ifFalse: [^ self].
	historyPluginList do: [ :plug | historyPlugin := plug ].
]

{ #category : #initialization }
PyramidShortcutUndoRedo >> initialize [ 
	
	"Do nothing"
]

{ #category : #accessing }
PyramidShortcutUndoRedo >> keyCombinationRedo [
	"CTRL + Y to activate this shortcut"
	^ keyCombinationRedo ifNil: [
		  keyCombinationRedo := ((BlKeyCombination builder key: KeyboardKey controlLeft; key: KeyboardKey Y) build)]
]

{ #category : #accessing }
PyramidShortcutUndoRedo >> keyCombinationRedo: aNewKeyCombination [

	^ keyCombinationRedo := aNewKeyCombination
]

{ #category : #accessing }
PyramidShortcutUndoRedo >> keyCombinationUndo [
	"CTRL + Z to activate this shortcut"
	^ keyCombinationUndo ifNil: [
		  keyCombinationUndo := ((BlKeyCombination builder key: KeyboardKey controlLeft; key: KeyboardKey Z) build) ]
]

{ #category : #accessing }
PyramidShortcutUndoRedo >> keyCombinationUndo: aNewKeyCombination [

	^ keyCombinationUndo := aNewKeyCombination
]

{ #category : #accessing }
PyramidShortcutUndoRedo >> shortcutActionRedo [

	^ shortcutRedo ifNil: [
		  shortcutRedo := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut redo';
			              combination: self keyCombinationRedo;
			              action: [ :event | historyPlugin history redo. 
														historyPlugin projectModel informElementsChanged ] ]
]

{ #category : #accessing }
PyramidShortcutUndoRedo >> shortcutActionUndo [

	^ shortcutUndo ifNil: [
		  shortcutUndo := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut undo';
			              combination: self keyCombinationUndo;
			              action: [ :event | historyPlugin history undo. 
														historyPlugin projectModel informElementsChanged ] ]
]
