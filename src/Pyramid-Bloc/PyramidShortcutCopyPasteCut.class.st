"
This class is used to create the shortcut for copy and paste -> use the plugin-copy-paste from this package.

It use the editor to get the collection of selected object from project model in Pyramid space.
"
Class {
	#name : #PyramidShortcutCopyPasteCut,
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

{ #category : #'as yet unclassified' }
PyramidShortcutCopyPasteCut >> copyPasteCutPluginFromPyramid: aPyramidEditor [

	| copyPastePluginList navigationPluginList |
	"get copyPastePlugin"
	self elementCollectionSelected: aPyramidEditor.
	copyPastePluginList := aPyramidEditor plugins select: [ :plugin | plugin isKindOf: PyramidCopyPastePlugin ].
	copyPastePluginList size = 1
	ifFalse: [^ self].
	copyPastePlugin := copyPastePluginList asArray first.
	
	"Get navigationPlugin"
	navigationPluginList := aPyramidEditor plugins select: [ :plugin | plugin isKindOf: PyramidNavigationPlugin ].
	navigationPluginList size = 1
	ifFalse: [^ self].
	navigationPlugin := navigationPluginList asArray first
]

{ #category : #accessing }
PyramidShortcutCopyPasteCut >> copyPastePlugin: aPlugin [

	copyPastePlugin := aPlugin
]

{ #category : #testing }
PyramidShortcutCopyPasteCut >> copySelectedElementInSpace [

	elementCollectionSelected isEmpty
	ifTrue: [ ^ self ].
	elementCollectionSelected size = 1
	ifTrue: [ elementCollectionSelected do: [ :element | copyPastePlugin copyAsStonInClipboard: element ]. ^ 1 ]
	ifFalse: [ self inform: 'Can not copy multiple element' ]
	
	
	
]

{ #category : #accessing }
PyramidShortcutCopyPasteCut >> defaultKeyCombinationCopy [
	"CTRL + C to activate this shortcut"
	keyCombinationCopy := ((BlKeyCombination builder key: KeyboardKey controlLeft; key: KeyboardKey C) build)
]

{ #category : #accessing }
PyramidShortcutCopyPasteCut >> defaultKeyCombinationCut [
	"CTRL + X to activate this shortcut"
	keyCombinationCut := ((BlKeyCombination builder key: KeyboardKey controlLeft; key: KeyboardKey X) build)
]

{ #category : #accessing }
PyramidShortcutCopyPasteCut >> defaultKeyCombinationPaste [
	"CTRL + V to activate this shortcut"
	keyCombinationPaste := ((BlKeyCombination builder key: KeyboardKey controlLeft; key: KeyboardKey V) build)
]

{ #category : #accessing }
PyramidShortcutCopyPasteCut >> elementCollectionSelected: aPyramidEditor [

	elementCollectionSelected := (aPyramidEditor projectModel selection) collection.
]

{ #category : #initialization }
PyramidShortcutCopyPasteCut >> initialize [ 

	self defaultKeyCombinationCopy.
	self defaultKeyCombinationPaste.
	self defaultKeyCombinationCut.
]

{ #category : #accessing }
PyramidShortcutCopyPasteCut >> keyCombinationCopy: aKeyCombination [
	
	^ keyCombinationCopy := aKeyCombination
]

{ #category : #accessing }
PyramidShortcutCopyPasteCut >> keyCombinationCut: aKeyCombination [

	^ keyCombinationCut := aKeyCombination
]

{ #category : #accessing }
PyramidShortcutCopyPasteCut >> keyCombinationPaste: aKeyCombination [

	^ keyCombinationPaste := aKeyCombination
]

{ #category : #testing }
PyramidShortcutCopyPasteCut >> pasteElement [

	elementCollectionSelected isEmpty
	ifTrue: [ copyPastePlugin pasteFromClipboardOnFirstLevelElements ].
	elementCollectionSelected size = 1
	ifTrue: [ elementCollectionSelected do: [ :element | copyPastePlugin pasteFromClipboardOnSelection: element ]. ]
	
	
	
]

{ #category : #accessing }
PyramidShortcutCopyPasteCut >> shortcutActionCopy [

	^ shortcutCopy := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut copy';
			              combination: keyCombinationCopy;
			              action: [ :event | copyPastePlugin 
														ifNil: [ self inform: 'Plugin Copy/Paste is not installed' ]
														ifNotNil: [ self copySelectedElementInSpace ] ]
]

{ #category : #accessing }
PyramidShortcutCopyPasteCut >> shortcutActionCut [

	^ shortcutCut := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut paste';
			              combination: keyCombinationCut;
			              action: [ :event | copyPastePlugin
														ifNil: [ self inform: 'Plugin Copy/Paste is not installed' ]
														ifNotNil: [ self copySelectedElementInSpace = 1
																		ifTrue: [ navigationPlugin removeSelectedElements ] ] ]
]

{ #category : #accessing }
PyramidShortcutCopyPasteCut >> shortcutActionPaste [

	^ shortcutPaste := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut paste';
			              combination: keyCombinationPaste;
			              action: [ :event | copyPastePlugin
														ifNil: [ self inform: 'Plugin Copy/Paste is not installed' ]
														ifNotNil: [ self pasteElement ] ]
]
