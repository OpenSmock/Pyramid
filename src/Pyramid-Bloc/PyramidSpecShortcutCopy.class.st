"
This class is used to create the shortcut for copy and paste -> use the plugin-copy-paste from this package.

It use the editor to get the collection of selected object from project model in Pyramid space.
"
Class {
	#name : #PyramidSpecShortcutCopy,
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

{ #category : #'as yet unclassified' }
PyramidSpecShortcutCopy >> copySelectedElementInSpace [

	elementCollectionSelected isEmpty ifTrue: [ ^ self ].
	elementCollectionSelected size = 1
		ifTrue: [
			plugin copyAsStonInClipboard: elementCollectionSelected first.
			^ 1 ]
		ifFalse: [ self inform: 'Can not copy multiple element' ]
]

{ #category : #accessing }
PyramidSpecShortcutCopy >> defaultKeyCombination [
	"CTRL + C to activate this shortcut"

	keyCombination := $c command mac | $c control unix | $c control win
]

{ #category : #accessing }
PyramidSpecShortcutCopy >> elementCollectionSelected: aPyramidEditor [

	elementCollectionSelected := aPyramidEditor projectModel selection
		                             collection
]

{ #category : #initialization }
PyramidSpecShortcutCopy >> initialize [

	self defaultKeyCombination.
]

{ #category : #'accessing - classes' }
PyramidSpecShortcutCopy >> pluginFromPyramid: aPyramidEditor [
	
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
PyramidSpecShortcutCopy >> shortcutAction [

	shortcutAction := PyramidSpecShortcutActionObject new.
	^ shortcutAction
		  shortcut: keyCombination;
		  action: [
			  plugin
				  ifNil: [ self inform: 'Plugin Copy/Paste is not installed' ]
				  ifNotNil: [ self copySelectedElementInSpace ] ]
]
