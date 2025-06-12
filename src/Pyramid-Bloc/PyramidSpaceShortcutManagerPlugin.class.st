"
This class is use to add shortcut to the space in pyramid to use feature, you can check the PyramidShortcutUndoRedo as exemple.

Shortcut only works when the space of Pyramid have the focus.

List of current active shortcut (default value) :
- Save -> ctrl + S
- Undo -> ctrl + Z
- Redo -> ctrl + Y
- Copy -> ctrl + C
- Paste -> ctrl + V
- Grid visibility switch -> ctrl + G
"
Class {
	#name : #PyramidSpaceShortcutManagerPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'editor',
		'listOfShortcut',
		'shortcutUndoRedo',
		'shortcutCopyPaste',
		'shortcutSaveAction',
		'shortcutGrid',
		'shortcutRemoveElement',
		'spacePlugin',
		'historyPlugin',
		'copyPastePlugin',
		'copyPasteMenuPanelBuilder',
		'savePlugin',
		'gridFeature',
		'navigationPlugin'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #accessing }
PyramidSpaceShortcutManagerPlugin >> addAllShortcutInSpace: aSpace [
	
	"Shortcut Undo (ctrl + Z) / Redo (ctrl + Y) "
	self addingNewShortcutInSpace: aSpace shortcut: shortcutUndoRedo shortcutActionUndo. 
	self addingNewShortcutInSpace: aSpace shortcut: shortcutUndoRedo shortcutActionRedo.
	
	"Shortcut Copy (ctrl + C) / Paste (ctrl + V)"
	self addingNewShortcutInSpace: aSpace shortcut: shortcutCopyPaste shortcutActionCopy.
	self addingNewShortcutInSpace: aSpace shortcut: shortcutCopyPaste shortcutActionPaste.
	
	"Shortcut Save (ctrl + S)"
	self addingNewShortcutInSpace: aSpace shortcut: shortcutSaveAction shortcutActionSave.
	
	"Shortcut grid"
	"Grid visibility (ctrl + G)"
	self addingNewShortcutInSpace: aSpace shortcut: shortcutGrid shortcutActionGridVisibility.
	
	"Shortcut Remove Element (suppr / del)"
	self addingNewShortcutInSpace: aSpace shortcut: shortcutRemoveElement shortcutActionRemoveElement.
	
	"New shortcut to add under this comment keep the same patern as before"
]

{ #category : #'as yet unclassified' }
PyramidSpaceShortcutManagerPlugin >> addingNewShortcutInSpace: aSpace shortcut: aShortcut [

	listOfShortcut add: aShortcut.
	aSpace root addShortcut: aShortcut
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
	
	"Get Navigation Plugin for shortcut remove element"
	shortcutRemoveElement navigationPluginForRemoveElementFromPyramid: editor.
	
	
	
	"Adding shortcut to Pyramid"
	spacePlugin resetBloc: [ :aSpace | self refreshAllShortcutInSpace: aSpace ].
	spacePlugin resetSpace.
	
]

{ #category : #initialization }
PyramidSpaceShortcutManagerPlugin >> initialize [ 
	
	listOfShortcut := OrderedCollection new.
	
	shortcutUndoRedo := PyramidShortcutUndoRedo new.
	shortcutCopyPaste := PyramidShortcutCopyPaste new.
	shortcutSaveAction := PyramidShortcutSave new.
	shortcutGrid := PyramidShortcutGrid new.
	shortcutRemoveElement := PyramidShortcutRemoveElement new.
]

{ #category : #'as yet unclassified' }
PyramidSpaceShortcutManagerPlugin >> refreshAllShortcutInSpace: aSpace [
	
	self removeAllShortcutInSpace: aSpace.
	self addAllShortcutInSpace: aSpace.
	
	
]

{ #category : #removing }
PyramidSpaceShortcutManagerPlugin >> removeAllShortcutInSpace: aSpace [

	listOfShortcut do: [ :shortcut | aSpace root removeShortcut: shortcut ].
	listOfShortcut removeAll.
]
