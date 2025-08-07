"
Class use to create the shortcut undo / redo.

Use the history feature from the package Pyramid.
"
Class {
	#name : #PyramidSpecShortcutRedo,
	#superclass : #PyramidSpecShortcutManagerPlugin,
	#traits : 'TPyramidShortcutSpec',
	#classTraits : 'TPyramidShortcutSpec classTrait',
	#instVars : [
		'plugin',
		'keyCombination',
		'shortcutAction'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #accessing }
PyramidSpecShortcutRedo >> defaultKeyCombination [
	"CTRL + Y to activate this shortcut"

	keyCombination := $y command mac | $y control unix | $y control win
]

{ #category : #initialization }
PyramidSpecShortcutRedo >> initialize [

	self defaultKeyCombination.
	self defaultKeyCombination
]

{ #category : #'accessing - classes' }
PyramidSpecShortcutRedo >> pluginFromPyramid: aPyramidEditor [
	
	| listOfPlugins pluginSorted |
	
	listOfPlugins := aPyramidEditor plugins.
	pluginSorted := listOfPlugins select: [ :extensions | extensions isKindOf: PyramidHistoryPlugin ].
	pluginSorted size = 1
	ifFalse: [^ self].
	plugin := pluginSorted asArray first
]

{ #category : #accessing }
PyramidSpecShortcutRedo >> shortcutAction [

	shortcutAction := PyramidSpecShortcutActionObject new.
	^ shortcutAction
		  shortcut: keyCombination;
		  action: [
			  plugin
				  ifNil: [ self inform: 'Plugin undo/redo is not installed' ]
				  ifNotNil: [
					  plugin history redo.
					  plugin projectModel informElementsChanged ] ]
]
