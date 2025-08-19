"
This class is used to define for moving child position in his parent between each child.
"
Class {
	#name : #PyramidSpecShortcutMoveChildDownInParent,
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
PyramidSpecShortcutMoveChildDownInParent >> defaultKeyCombination [
	"CTRL + PageDown to activate this shortcut"

	keyCombination := Character pageDown
]

{ #category : #initialization }
PyramidSpecShortcutMoveChildDownInParent >> initialize [

	self defaultKeyCombination.
	self defaultKeyCombination
]

{ #category : #'as yet unclassified' }
PyramidSpecShortcutMoveChildDownInParent >> pluginFromPyramid: aPyramidEditor [
	
	| listOfPlugins pluginSorted |
	
	listOfPlugins := aPyramidEditor plugins.
	pluginSorted := listOfPlugins select: [ :extensions | extensions isKindOf: PyramidMoveChildInParentPlugin ].
	pluginSorted size = 1
	ifFalse: [^ self].
	plugin := pluginSorted asArray first
]

{ #category : #accessing }
PyramidSpecShortcutMoveChildDownInParent >> shortcutAction [

	shortcutAction := PyramidSpecShortcutActionObject new.
	^ shortcutAction
		  shortcut: keyCombination;
		  action: [
			  plugin
				  ifNil: [
					  self inform: 'Plugin MoveChildInParentPlugin is not installed' ]
				  ifNotNil: [ plugin moveChildIndexDownInParent ] ]
]
