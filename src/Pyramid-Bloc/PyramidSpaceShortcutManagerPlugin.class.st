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
		'shortcutCollection',
		'shortcutUndoRedo',
		'shortcutCopyPaste',
		'shortcutSaveAction',
		'shortcutGrid',
		'shortcutRemoveElement',
		'spacePlugin'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #adding }
PyramidSpaceShortcutManagerPlugin >> addAllShortcutInCollection [
	"Default values of the different shortcut"
	
	"Shortcut Undo (ctrl + Z) / Redo (ctrl + Y) "
	shortcutCollection add: shortcutUndoRedo shortcutActionUndo. 
	shortcutCollection add: shortcutUndoRedo shortcutActionRedo.
	
	"Shortcut Copy (ctrl + C) / Paste (ctrl + V)"
	shortcutCollection add: shortcutCopyPaste shortcutActionCopy.
	shortcutCollection add: shortcutCopyPaste shortcutActionPaste.
	
	"Shortcut Save (ctrl + S)"
	shortcutCollection add: shortcutSaveAction shortcutActionSave.
	
	"Shortcut grid"
	"Grid visibility (ctrl + G)"
	shortcutCollection add: shortcutGrid shortcutActionGridVisibility.
	
	"Shortcut Remove Element (suppr / del)"
	shortcutCollection add: shortcutRemoveElement shortcutActionRemoveElement.
	
	"New shortcut to add under this comment, keep the same patern as before"
	
]

{ #category : #accessing }
PyramidSpaceShortcutManagerPlugin >> addAllShortcutInSpace: aSpace [
	
	self addAllShortcutInCollection.
	shortcutCollection do: [ :shortcut | aSpace root addShortcut: shortcut ].

	
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
	
	shortcutCollection := OrderedCollection new.
	
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

	shortcutCollection do: [ :shortcut | aSpace root removeShortcut: shortcut ].
	shortcutCollection removeAll.
]
