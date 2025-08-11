"
This class is used to create the shortcut for copy and paste -> use the plugin-copy-paste from this package.

It use the editor to get the collection of selected object from project model in Pyramid space.
"
Class {
	#name : #PyramidSpecShortcutCut,
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
PyramidSpecShortcutCut >> copySelectedElementInSpace [

	elementCollectionSelected isEmpty ifTrue: [ ^ self ].
	elementCollectionSelected size = 1
		ifTrue: [
			plugin copyAsStonInClipboard:
				elementCollectionSelected first.
			^ 1 ]
		ifFalse: [ self inform: 'Can not copy multiple element' ]
]

{ #category : #accessing }
PyramidSpecShortcutCut >> defaultKeyCombination [
	"CTRL + X to activate this shortcut"

	keyCombination := $x command mac | $x control unix | $x control win
]

{ #category : #accessing }
PyramidSpecShortcutCut >> elementCollectionSelected: aPyramidEditor [

	elementCollectionSelected := aPyramidEditor projectModel selection
		                             collection
]

{ #category : #initialization }
PyramidSpecShortcutCut >> initialize [

	self defaultKeyCombination.
]

{ #category : #'as yet unclassified' }
PyramidSpecShortcutCut >> pluginFromPyramid: aPyramidEditor [
	
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
PyramidSpecShortcutCut >> shortcutAction [

	shortcutAction := PyramidSpecShortcutActionObject new.
	^ shortcutAction
		  shortcut: keyCombination;
		  action: [
			  plugin
				  ifNil: [ self inform: 'Plugin Copy/Paste is not installed' ]
				  ifNotNil: [
					  self copySelectedElementInSpace = 1 ifTrue: [
							  navigationPlugin removeSelectedElements ] ] ]
]
