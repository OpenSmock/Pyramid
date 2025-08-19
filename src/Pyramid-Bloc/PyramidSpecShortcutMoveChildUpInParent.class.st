"
This class is used to define for moving child position in his parent between each child.
"
Class {
	#name : #PyramidSpecShortcutMoveChildUpInParent,
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
PyramidSpecShortcutMoveChildUpInParent >> defaultKeyCombination [
	"CTRL + PageUp to activate this shortcut"

	keyCombination := Character pageUp
]

{ #category : #initialization }
PyramidSpecShortcutMoveChildUpInParent >> initialize [

	self defaultKeyCombination.
	self defaultKeyCombination
]

{ #category : #'accessing - classes' }
PyramidSpecShortcutMoveChildUpInParent >> pluginFromPyramid: aPyramidEditor [
	
	| listOfPlugins pluginSorted |
	
	listOfPlugins := aPyramidEditor plugins.
	pluginSorted := listOfPlugins select: [ :extensions | extensions isKindOf: PyramidMoveChildInParentPlugin ].
	pluginSorted size = 1
	ifFalse: [^ self].
	plugin := pluginSorted asArray first
]

{ #category : #accessing }
PyramidSpecShortcutMoveChildUpInParent >> shortcutAction [

	shortcutAction := PyramidSpecShortcutActionObject new.
	^ shortcutAction
		  shortcut: keyCombination;
		  action: [
			  plugin
				  ifNil: [
					  self inform: 'Plugin MoveChildInParentPlugin is not installed' ]
				  ifNotNil: [ plugin moveChildIndexUpInParent ] ]
]
