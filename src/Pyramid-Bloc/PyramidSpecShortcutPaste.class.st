"
This class is used to create the shortcut for copy and paste -> use the plugin-copy-paste from this package.

It use the editor to get the collection of selected object from project model in Pyramid space.
"
Class {
	#name : #PyramidSpecShortcutPaste,
	#superclass : #PyramidSpecShortcutManagerPlugin,
	#traits : 'TPyramidShortcutSpec',
	#classTraits : 'TPyramidShortcutSpec classTrait',
	#instVars : [
		'plugin',
		'keyCombination',
		'shortcutAction',
		'navigationPlugin',
		'elementCollectionSelected'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #accessing }
PyramidSpecShortcutPaste >> defaultKeyCombination [
	"CTRL + V to activate this shortcut"

	keyCombination := $v command mac | $v control unix | $v control win
]

{ #category : #accessing }
PyramidSpecShortcutPaste >> elementCollectionSelected: aPyramidEditor [

	elementCollectionSelected := aPyramidEditor projectModel selection
		                             collection
]

{ #category : #initialization }
PyramidSpecShortcutPaste >> initialize [

	self defaultKeyCombination.
]

{ #category : #action }
PyramidSpecShortcutPaste >> pasteElement [

	elementCollectionSelected isEmpty ifTrue: [
		plugin pasteFromClipboardOnFirstLevelElements ].
	elementCollectionSelected size = 1 ifTrue: [
		plugin pasteFromClipboardOnSelection:
			elementCollectionSelected first ]
]

{ #category : #'accessing - classes' }
PyramidSpecShortcutPaste >> pluginFromPyramid: aPyramidEditor [
	
	| listOfPlugins pluginSorted |
	
	self elementCollectionSelected: aPyramidEditor.
	
	listOfPlugins := aPyramidEditor plugins.
	pluginSorted := listOfPlugins select: [ :extensions | extensions isKindOf: PyramidCopyPastePlugin ].
	pluginSorted size = 1
	ifFalse: [^ self].
	plugin := pluginSorted asArray first.
	
	pluginSorted := listOfPlugins select: [ :extensions | extensions isKindOf: PyramidNavigationPlugin ].
	pluginSorted size = 1
	ifFalse: [^ self].
	navigationPlugin := pluginSorted asArray first
]

{ #category : #accessing }
PyramidSpecShortcutPaste >> shortcutAction [

	shortcutAction := PyramidSpecShortcutActionObject new.
	^ shortcutAction
		  shortcut: keyCombination;
		  action: [
			  plugin
				  ifNil: [ self inform: 'Plugin Copy/Paste is not installed' ]
				  ifNotNil: [ self pasteElement ] ]
]
