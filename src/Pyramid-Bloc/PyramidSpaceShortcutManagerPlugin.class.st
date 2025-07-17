"
This class is use to add shortcut to the space in pyramid to use feature, you can check the PyramidShortcutUndoRedo as exemple.

Shortcut only works when the space of Pyramid have the focus.

List of current active shortcut (default value) :
- Save -> ctrl + S
- Undo -> ctrl + Z
- Redo -> ctrl + Y
- Copy -> ctrl + C
- Paste -> ctrl + V
- Cut -> ctrl + X
- Grid visibility switch -> ctrl + G
- Select all element -> ctrl + A
- Delete selected element -> delete or suppr
- Inspect one selected element -> ctrl + I
- Move up child (ctrl + Arrow Up)
- Move down child (ctrl + Arrow Down)
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
		'shortcutSelectAllElement',
		'shortcutInspectSelectedElement',
		'shortcutMoveChildInParent'
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
	shortcutCollection add: shortcutCopyPaste shortcutActionCut.
	
	"Shortcut Save (ctrl + S)"
	shortcutCollection add: shortcutSaveAction shortcutActionSave.
	
	"Shortcut grid"
	"Grid visibility (ctrl + G)"
	shortcutCollection add: shortcutGrid shortcutActionGridVisibility.
	
	"Shortcut Remove Element (suppr / del)"
	shortcutCollection add: shortcutRemoveElement shortcutActionRemoveElement.
	
	"Shortcut Select all element in space (ctrl + A)"
	shortcutCollection add: shortcutSelectAllElement shortcutActionSelectAll.
	
	"Shortcut inspect selected element (ctrl + I)"
	shortcutCollection add: shortcutInspectSelectedElement shortcutActionInspect.
	
	"Shortcut Move child in parent"
	"Move up (ctrl + Arrow up)"
	shortcutCollection add: shortcutMoveChildInParent shortcutActionMoveUp.
	"Move down (ctrl + Arrow down)"
	shortcutCollection add: shortcutMoveChildInParent shortcutActionMoveDown.
	
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
	shortcutCopyPaste copyPasteCutPluginFromPyramid: aPyramidEditor.
	
	"Get Save plugin"
	shortcutSaveAction savePluginFromPyramid: aPyramidEditor.
	
	"Get space MainExtension"
	shortcutGrid gridFeatureFromSpacePlugin: aPyramidEditor.
	
	"Get Navigation Plugin for shortcut remove element"
	shortcutRemoveElement navigationPluginFromPyramid: aPyramidEditor.
	
	shortcutSelectAllElement projectModelFromPyramid: aPyramidEditor.
	
	"Get projectModelFromPyramid for Inspect selected element"
	shortcutInspectSelectedElement projectModelFromPyramid: aPyramidEditor.
	
	"Get navigation plugin for MoveChildInParentPlugin"
	shortcutMoveChildInParent moveChildInParentPluginFromPyramid: aPyramidEditor.
	
	"Adding shortcut to Pyramid"
	spacePlugin resetShortcutBlock: [ :aSpace | self refreshAllShortcutInSpace: aSpace ].
	spacePlugin resetSpace.
]

{ #category : #initialization }
PyramidSpaceShortcutManagerPlugin >> initialize [ 

	shortcutCollection := OrderedCollection new.
	
	shortcutUndoRedo := PyramidSpaceShortcutUndoRedo new.
	shortcutCopyPaste := PyramidSpaceShortcutCopyPasteCut new.
	shortcutSaveAction := PyramidSpaceShortcutSave new.
	shortcutGrid := PyramidSpaceShortcutGrid new.
	shortcutRemoveElement := PyramidSpaceShortcutRemoveElement new.
	shortcutSelectAllElement := PyramidSpaceShortcutSelectAllElement new.
	shortcutInspectSelectedElement := PyramidSpaceShortcutInspectSelectedElement new.
	shortcutMoveChildInParent := PyramidSpaceShortcutMoveChildInParent new.
]

{ #category : #action }
PyramidSpaceShortcutManagerPlugin >> refreshAllShortcutInSpace: aSpace [
	
	self removeAllShortcutInSpace: aSpace.
	self addAllShortcutInSpace: aSpace.
	
	
]

{ #category : #removing }
PyramidSpaceShortcutManagerPlugin >> removeAllShortcutInSpace: aSpace [

	shortcutCollection do: [ :shortcut | aSpace root removeShortcut: shortcut ].
	shortcutCollection removeAll.
]
