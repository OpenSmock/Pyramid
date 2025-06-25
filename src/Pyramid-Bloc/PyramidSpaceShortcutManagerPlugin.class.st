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
- Select all element -> ctrl + A
- Delete selected element -> delete or suppr
"
Class {
	#name : #PyramidSpaceShortcutManagerPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'shortcutCollection',
		'shortcutUndoRedo',
		'shortcutCopyPaste',
		'shortcutSaveAction',
		'shortcutGrid',
		'shortcutRemoveElement',
		'shortcutSelectAllElement'
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
	
	"Shortcut Select all element in space (ctrl + A)"
	shortcutCollection add: shortcutSelectAllElement shortcutActionSelectAll.
	
	"New shortcut to add under this comment, keep the same patern as before"
	
]

{ #category : #accessing }
PyramidSpaceShortcutManagerPlugin >> addAllShortcutInSpace: aSpace [
	
	self addAllShortcutInCollection.
	shortcutCollection do: [ :shortcut | aSpace root addShortcut: shortcut ].

	
]

{ #category : #connecting }
PyramidSpaceShortcutManagerPlugin >> connectOn: aPyramidEditor [

	| spacePlugin spacePluginSet |
	
	"Get the space plugin to adding shortcut"
	spacePluginSet := aPyramidEditor plugins select: [ :plugin | plugin isKindOf: PyramidSpacePlugin ].
	spacePluginSet size = 1
	ifFalse: [self inform: 'Space plugin is not installed -> impossible to install shortcut to the space'.
				^ self].
	spacePlugin := spacePluginSet asArray first.
	
	"Get History plugin for Undo / Redo shortcut"
	shortcutUndoRedo historyPluginFromPyramid: aPyramidEditor.
	
	"Get Copy Paste plugin"
	shortcutCopyPaste copyPastePluginFromPyramid: aPyramidEditor.
	
	"Get Save plugin"
	shortcutSaveAction savePluginFromPyramid: aPyramidEditor.
	
	"Get space MainExtension"
	shortcutGrid gridFeatureFromSpacePlugin: aPyramidEditor.
	
	"Get Navigation Plugin for shortcut remove element"
	shortcutRemoveElement navigationPluginForRemoveElementFromPyramid: aPyramidEditor.
	
	shortcutSelectAllElement projectModelFromPyramid: aPyramidEditor.
	
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
	shortcutSelectAllElement := PyramidShortcutSelectAllElement new.
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
