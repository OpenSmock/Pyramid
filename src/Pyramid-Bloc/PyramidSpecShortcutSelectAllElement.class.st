"
This class used to create shortcut for select all element or all children from one selected element in Pyramid space.
"
Class {
	#name : #PyramidSpecShortcutSelectAllElement,
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
PyramidSpecShortcutSelectAllElement >> defaultKeyCombination [
	"CTRL + A to activate this shortcut"

	keyCombination := $a command mac | $a control unix | $a control win
]

{ #category : #initialization }
PyramidSpecShortcutSelectAllElement >> initialize [

	self defaultKeyCombination
]

{ #category : #'accessing - classes' }
PyramidSpecShortcutSelectAllElement >> pluginFromPyramid: aPyramidEditor [

	plugin := aPyramidEditor projectModel
]

{ #category : #'api - selection' }
PyramidSpecShortcutSelectAllElement >> selectAll [

	plugin selection asArray isEmpty ifTrue: [
		self selectAllElementInSpace. ^ self ].
	plugin selection asArray size = 1 ifTrue: [
		self selectAllChildrenOfSelectedElement ]
]

{ #category : #action }
PyramidSpecShortcutSelectAllElement >> selectAllChildrenOfSelectedElement [

	plugin selection collection asArray first children isEmpty
		ifTrue: [
		self inform: 'No children to select in the selected element' ]
		ifFalse: [
			plugin setSelection:
				plugin selection collection asArray first children ]
]

{ #category : #action }
PyramidSpecShortcutSelectAllElement >> selectAllElementInSpace [

	plugin setSelection: plugin firstLevelElements collection
]

{ #category : #accessing }
PyramidSpecShortcutSelectAllElement >> shortcutAction [

	shortcutAction := PyramidSpecShortcutActionObject new.
	^ shortcutAction
		  shortcut: keyCombination;
		  action: [
			  plugin
				  ifNil: [ self inform: 'problem with the project model' ]
				  ifNotNil: [ self selectAll ] ]
]
