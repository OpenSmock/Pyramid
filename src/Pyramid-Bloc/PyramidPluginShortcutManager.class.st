Class {
	#name : #PyramidPluginShortcutManager,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'editor',
		'builder',
		'shortcutUndoRedo',
		'spacePlugin',
		'historyPlugin'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #accessing }
PyramidPluginShortcutManager >> addShortcutInSpace: aSpace [
	
	"Shortcut Undo / Redo"
	aSpace root addShortcut: shortcutUndoRedo shortcutActionUndo.
	aSpace root addShortcut: shortcutUndoRedo shortcutActionRedo. 
	
	"New shortcut to add"
]

{ #category : #accessing }
PyramidPluginShortcutManager >> builder [ 
	^ builder
]

{ #category : #accessing }
PyramidPluginShortcutManager >> builder: aPyramidBuilder [
	
	builder := aPyramidBuilder 
]

{ #category : #connecting }
PyramidPluginShortcutManager >> connectOn: aPyramidEditor [

	| spacePluginList |
	editor := aPyramidEditor.
	"Get the space plugin to adding shortcut"
	spacePluginList := editor plugins select: [ :plugin | plugin isKindOf: PyramidSpacePlugin ].
	spacePluginList size = 1
	ifFalse: [^ self].
	spacePluginList do: [ :plug | spacePlugin := plug ].
	
	"Get History plugin"
	shortcutUndoRedo historyPluginFromPyramid: editor.
	
	"Adding shortcut to Pyramid"
	spacePlugin resetBloc: [ :aSpace | self addShortcutInSpace: aSpace ].
	spacePlugin resetSpace.
	
]

{ #category : #initialization }
PyramidPluginShortcutManager >> initialize [ 

	shortcutUndoRedo := PyramidShortcutUndoRedo new.
]
