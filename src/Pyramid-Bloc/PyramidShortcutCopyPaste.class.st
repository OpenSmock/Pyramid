"
This class is used to create the shortcut for copy and paste.

It use the editor to get the collection of selected object from project model in Pyramid space.
"
Class {
	#name : #PyramidShortcutCopyPaste,
	#superclass : #PyramidSpaceShortcutManagerPlugin,
	#instVars : [
		'shortcutCopy',
		'shortcutPaste',
		'keyCombinationCopy',
		'keyCombinationPaste',
		'elementCollectionSelected'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #testing }
PyramidShortcutCopyPaste >> canCopyElement [

	elementCollectionSelected isEmpty
	ifTrue: [ ^ self ].
	elementCollectionSelected size = 1
	ifTrue: [ elementCollectionSelected do: [ :element | copyPastePlugin copyAsStonInClipboard: element ]. ]
	ifFalse: [ ^ self ]
	
	
	
]

{ #category : #testing }
PyramidShortcutCopyPaste >> canPasteElement [

	elementCollectionSelected isEmpty
	ifTrue: [ copyPastePlugin pasteFromClipboardOnFirstLevelElements ].
	elementCollectionSelected size = 1
	ifTrue: [ elementCollectionSelected do: [ :element | copyPastePlugin pasteFromClipboardOnSelection: element ]. ]
	ifFalse: [ ^ self ]
	
	
	
]

{ #category : #'as yet unclassified' }
PyramidShortcutCopyPaste >> copyPastePluginFromPyramid: aPyramidEditor [

	| copyPastePluginList |
	self elementCollection: aPyramidEditor.
	copyPastePluginList := aPyramidEditor plugins select: [ :plugin | plugin isKindOf: PyramidCopyPastePlugin ].
	copyPastePluginList size = 1
	ifFalse: [^ self].
	copyPastePluginList do: [ :plug | copyPastePlugin := plug ].
]

{ #category : #accessing }
PyramidShortcutCopyPaste >> elementCollection: aPyramidEditor [

	elementCollectionSelected := (aPyramidEditor projectModel selection) collection.
]

{ #category : #initialization }
PyramidShortcutCopyPaste >> initialize [ 

	"Do nothing"
]

{ #category : #accessing }
PyramidShortcutCopyPaste >> keyCombinationCopy [
	"CTRL + C to activate this shortcut"
	^ keyCombinationCopy ifNil: [
		  keyCombinationCopy := ((BlKeyCombination builder key: KeyboardKey controlLeft; key: KeyboardKey C) build) ]
]

{ #category : #accessing }
PyramidShortcutCopyPaste >> keyCombinationCopy: aKeyCombination [
	
	^ keyCombinationCopy := aKeyCombination
]

{ #category : #accessing }
PyramidShortcutCopyPaste >> keyCombinationPaste [
	"CTRL + C to activate this shortcut"
	^ keyCombinationPaste ifNil: [
		  keyCombinationPaste := ((BlKeyCombination builder key: KeyboardKey controlLeft; key: KeyboardKey V) build) ]
]

{ #category : #accessing }
PyramidShortcutCopyPaste >> keyCombinationPaste: aKeyCombination [

	^ keyCombinationPaste := aKeyCombination
]

{ #category : #accessing }
PyramidShortcutCopyPaste >> shortcutActionCopy [

	^ shortcutCopy ifNil: [
		  shortcutCopy := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut copy';
			              combination: self keyCombinationCopy;
			              action: [ :event | self canCopyElement ] ]
]

{ #category : #accessing }
PyramidShortcutCopyPaste >> shortcutActionPaste [

	^ shortcutPaste ifNil: [
		  shortcutPaste := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut Paste';
			              combination: self keyCombinationPaste;
			              action: [ :event | self canPasteElement ] ]
]
