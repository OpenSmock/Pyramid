"
This class is use to add shortcut to the space in pyramid to use feature, you can check the PyramidShortcutUndoRedo as exemple.
"
Class {
	#name : #PyramidSpaceShortcutManagerPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'editor',
		'shortcutUndoRedo',
		'shortcutCopyPaste',
		'shortcutSaveAction',
		'shortcutGrid',
		'spacePlugin',
		'historyPlugin',
		'copyPastePlugin',
		'copyPasteMenuPanelBuilder',
		'savePlugin',
		'gridFeature'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #accessing }
PyramidSpaceShortcutManagerPlugin >> addShortcutInSpace: aSpace [
	
	"Shortcut Undo (ctrl + Z) / Redo (ctrl + Y) "
	aSpace root addShortcut: shortcutUndoRedo shortcutActionUndo.
	aSpace root addShortcut: shortcutUndoRedo shortcutActionRedo. 
	
	"Shortcut Copy (ctrl + C) / Paste (ctrl + V)"
	aSpace root addShortcut: shortcutCopyPaste shortcutActionCopy.
	aSpace root addShortcut: shortcutCopyPaste shortcutActionPaste.
	
	"Shortcut Save (ctrl + S)"
	aSpace root addShortcut: shortcutSaveAction shortcutActionSave.
	
	"Shortcut grid"
	"Grid visibility (ctrl + G)"
	aSpace root addShortcut: shortcutGrid shortcutActionGridVisibility.
	
	"New shortcut to add under this comment keep the same patern as before"
]

{ #category : #connecting }
PyramidSpaceShortcutManagerPlugin >> connectOn: aPyramidEditor [

	| spacePluginList |
	editor := aPyramidEditor.
	"Get the space plugin to adding shortcut"
	spacePluginList := editor plugins select: [ :plugin | plugin isKindOf: PyramidSpacePlugin ].
	spacePluginList size = 1
	ifFalse: [^ self].
	spacePluginList do: [ :plug | spacePlugin := plug ].
	
	"Get History plugin for Undo / Redo shortcut"
	shortcutUndoRedo historyPluginFromPyramid: editor.
	
	"Get Copy Paste plugin"
	shortcutCopyPaste copyPastePluginFromPyramid: editor.
	
	"Get Save plugin"
	shortcutSaveAction savePluginFromPyramid: editor.
	
	"Get space MainExtension"
	shortcutGrid gridFeatureFromSpacePlugin: editor.
	
	
	"Adding shortcut to Pyramid"
	spacePlugin resetBloc: [ :aSpace | self addShortcutInSpace: aSpace ].
	spacePlugin resetSpace.
	
]

{ #category : #initialization }
PyramidSpaceShortcutManagerPlugin >> initialize [ 

	shortcutUndoRedo := PyramidShortcutUndoRedo new.
	shortcutCopyPaste := PyramidShortcutCopyPaste new.
	shortcutSaveAction := PyramidShortcutSave new.
	shortcutGrid := PyramidShortcutGrid new.
]
