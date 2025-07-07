"
This class is used to create the shortcut for copy and paste -> use the plugin-copy-paste from this package.

It use the editor to get the collection of selected object from project model in Pyramid space.
"
Class {
	#name : #PyramidSpaceShortcutCopyPasteCut,
	#superclass : #PyramidSpaceShortcutManagerPlugin,
	#instVars : [
		'copyPastePlugin',
		'navigationPlugin',
		'shortcutCopy',
		'shortcutPaste',
		'keyCombinationCopy',
		'keyCombinationPaste',
		'elementCollectionSelected',
		'keyCombinationCut',
		'shortcutCut'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #'accessing - classes' }
PyramidSpaceShortcutCopyPasteCut >> copyPasteCutPluginFromPyramid: aPyramidEditor [
	
	"Connect selection array"
	self elementCollectionSelected: aPyramidEditor.
	"get copyPastePlugin"
	copyPastePlugin := aPyramidEditor findPlugin: PyramidCopyPastePlugin.
	"Get navigationPlugin"
	navigationPlugin := aPyramidEditor findPlugin: PyramidNavigationPlugin.
]

{ #category : #accessing }
PyramidSpaceShortcutCopyPasteCut >> copyPastePlugin: aPlugin [

	copyPastePlugin := aPlugin
]

{ #category : #action }
PyramidSpaceShortcutCopyPasteCut >> copySelectedElementInSpace [

	elementCollectionSelected isEmpty
	ifTrue: [ ^ self ].
	elementCollectionSelected size = 1
	ifTrue: [ copyPastePlugin copyAsStonInClipboard: (elementCollectionSelected first). ^ 1 ]
	ifFalse: [ self inform: 'Can not copy multiple element' ]
	
	
	
]

{ #category : #accessing }
PyramidSpaceShortcutCopyPasteCut >> defaultKeyCombinationCopy [
	"CTRL + C to activate this shortcut"
	keyCombinationCopy := ((BlKeyCombination builder primary key: KeyboardKey C) build)
]

{ #category : #accessing }
PyramidSpaceShortcutCopyPasteCut >> defaultKeyCombinationCut [
	"CTRL + X to activate this shortcut"
	keyCombinationCut := ((BlKeyCombination builder primary key: KeyboardKey X) build)
]

{ #category : #accessing }
PyramidSpaceShortcutCopyPasteCut >> defaultKeyCombinationPaste [
	"CTRL + V to activate this shortcut"
	keyCombinationPaste := ((BlKeyCombination builder primary key: KeyboardKey V) build)
]

{ #category : #accessing }
PyramidSpaceShortcutCopyPasteCut >> elementCollectionSelected: aPyramidEditor [

	elementCollectionSelected := (aPyramidEditor projectModel selection) collection.
]

{ #category : #initialization }
PyramidSpaceShortcutCopyPasteCut >> initialize [ 

	self defaultKeyCombinationCopy.
	self defaultKeyCombinationPaste.
	self defaultKeyCombinationCut.
]

{ #category : #accessing }
PyramidSpaceShortcutCopyPasteCut >> keyCombinationCopy: aKeyCombination [
	
	^ keyCombinationCopy := aKeyCombination
]

{ #category : #accessing }
PyramidSpaceShortcutCopyPasteCut >> keyCombinationCut: aKeyCombination [

	^ keyCombinationCut := aKeyCombination
]

{ #category : #accessing }
PyramidSpaceShortcutCopyPasteCut >> keyCombinationPaste: aKeyCombination [

	^ keyCombinationPaste := aKeyCombination
]

{ #category : #action }
PyramidSpaceShortcutCopyPasteCut >> pasteElement [

	elementCollectionSelected isEmpty
	ifTrue: [ copyPastePlugin pasteFromClipboardOnFirstLevelElements ].
	elementCollectionSelected size = 1
	ifTrue: [ copyPastePlugin pasteFromClipboardOnSelection: (elementCollectionSelected first) ]
	
	
	
]

{ #category : #accessing }
PyramidSpaceShortcutCopyPasteCut >> shortcutActionCopy [

	^ shortcutCopy := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut copy';
			              combination: keyCombinationCopy;
			              action: [ :event | copyPastePlugin 
														ifNil: [ self inform: 'Plugin Copy/Paste is not installed' ]
														ifNotNil: [ self copySelectedElementInSpace ] ]
]

{ #category : #accessing }
PyramidSpaceShortcutCopyPasteCut >> shortcutActionCut [

	^ shortcutCut := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut cut';
			              combination: keyCombinationCut;
			              action: [ :event | copyPastePlugin
														ifNil: [ self inform: 'Plugin Copy/Paste is not installed' ]
														ifNotNil: [ self copySelectedElementInSpace = 1
																		ifTrue: [ navigationPlugin removeSelectedElements ] ] ]
]

{ #category : #accessing }
PyramidSpaceShortcutCopyPasteCut >> shortcutActionPaste [

	^ shortcutPaste := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut paste';
			              combination: keyCombinationPaste;
			              action: [ :event | copyPastePlugin
														ifNil: [ self inform: 'Plugin Copy/Paste is not installed' ]
														ifNotNil: [ self pasteElement ] ]
]
