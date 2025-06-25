"
This class is used to create the shortcut for copy and paste -> use the plugin-copy-paste from this package.

It use the editor to get the collection of selected object from project model in Pyramid space.
"
Class {
	#name : #PyramidShortcutCopyPaste,
	#superclass : #PyramidSpaceShortcutManagerPlugin,
	#instVars : [
		'copyPastePlugin',
		'shortcutCopy',
		'shortcutPaste',
		'keyCombinationCopy',
		'keyCombinationPaste',
		'elementCollectionSelected'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #accessing }
PyramidShortcutCopyPaste >> copyPastePlugin: aPlugin [

	copyPastePlugin := aPlugin
]

{ #category : #'as yet unclassified' }
PyramidShortcutCopyPaste >> copyPastePluginFromPyramid: aPyramidEditor [

	| copyPastePluginList |
	self elementCollectionSelected: aPyramidEditor.
	copyPastePluginList := aPyramidEditor plugins select: [ :plugin | plugin isKindOf: PyramidCopyPastePlugin ].
	copyPastePluginList size = 1
	ifFalse: [^ self].
	copyPastePlugin := copyPastePluginList asArray first
]

{ #category : #testing }
PyramidShortcutCopyPaste >> copySelectedElementInSpace [

	elementCollectionSelected isEmpty
	ifTrue: [ ^ self ].
	elementCollectionSelected size = 1
	ifTrue: [ elementCollectionSelected do: [ :element | copyPastePlugin copyAsStonInClipboard: element ]. ]
	ifFalse: [ self inform: 'Can not copy multiple element' ]
	
	
	
]

{ #category : #accessing }
PyramidShortcutCopyPaste >> defaultKeyCombinationCopy [
	"CTRL + C to activate this shortcut"
	keyCombinationCopy := ((BlKeyCombination builder key: KeyboardKey controlLeft; key: KeyboardKey C) build)
]

{ #category : #accessing }
PyramidShortcutCopyPaste >> defaultKeyCombinationPaste [
	"CTRL + V to activate this shortcut"
	keyCombinationPaste := ((BlKeyCombination builder key: KeyboardKey controlLeft; key: KeyboardKey V) build)
]

{ #category : #accessing }
PyramidShortcutCopyPaste >> elementCollectionSelected: aPyramidEditor [

	elementCollectionSelected := (aPyramidEditor projectModel selection) collection.
]

{ #category : #initialization }
PyramidShortcutCopyPaste >> initialize [ 

	self defaultKeyCombinationCopy.
	self defaultKeyCombinationPaste.
]

{ #category : #accessing }
PyramidShortcutCopyPaste >> keyCombinationCopy: aKeyCombination [
	
	^ keyCombinationCopy := aKeyCombination
]

{ #category : #accessing }
PyramidShortcutCopyPaste >> keyCombinationPaste: aKeyCombination [

	^ keyCombinationPaste := aKeyCombination
]

{ #category : #testing }
PyramidShortcutCopyPaste >> pasteElement [

	elementCollectionSelected isEmpty
	ifTrue: [ copyPastePlugin pasteFromClipboardOnFirstLevelElements ].
	elementCollectionSelected size = 1
	ifTrue: [ elementCollectionSelected do: [ :element | copyPastePlugin pasteFromClipboardOnSelection: element ]. ]
	
	
	
]

{ #category : #accessing }
PyramidShortcutCopyPaste >> shortcutActionCopy [

	^ shortcutCopy := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut copy';
			              combination: keyCombinationCopy;
			              action: [ :event | copyPastePlugin 
														ifNil: [ self inform: 'Plugin Copy/Paste is not installed' ]
														ifNotNil: [ self copySelectedElementInSpace ] ]
]

{ #category : #accessing }
PyramidShortcutCopyPaste >> shortcutActionPaste [

	^ shortcutPaste := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut paste';
			              combination: keyCombinationPaste;
			              action: [ :event | copyPastePlugin
														ifNil: [ self inform: 'Plugin Copy/Paste is not installed' ]
														ifNotNil: [ self pasteElement ] ]
]
