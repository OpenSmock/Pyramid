"
This class is use to add shortcut to the space in pyramid to use feature, you can check the PyramidSpaceShortcutUndoRedo as exemple.

Shortcut only works when the space of Pyramid have the focus.

List of current active shortcut (default value) :
- Save -> ctrl + S
"
Class {
	#name : #PyramidSpaceShortcutManagerPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'collectionOfSpaceShortcutClass',
		'shortcutCollection'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #adding }
PyramidSpaceShortcutManagerPlugin >> addAllShortcutInCollection [
	"Default values of the different shortcut"

	collectionOfSpaceShortcutClass do: [ :shortcutClass |
		shortcutCollection add: shortcutClass shortcutAction ]

	"New shortcut to add under this comment, keep the same patern as before"
]

{ #category : #accessing }
PyramidSpaceShortcutManagerPlugin >> addAllShortcutInSpace: aSpace [

	self addAllShortcutInCollection.
	shortcutCollection do: [ :shortcut |
		aSpace root addShortcut: shortcut ]
]

{ #category : #connecting }
PyramidSpaceShortcutManagerPlugin >> connectOn: aPyramidEditor [

	| spacePlugin |
	"Get the space plugin to adding shortcut"
	spacePlugin := aPyramidEditor findPlugin: PyramidSpacePlugin.
	spacePlugin ifNil: [
		self inform:
			'Space plugin is not installed -> impossible to install shortcut to the space'.
		^ self ].

	self setupPluginOfShortcuts: aPyramidEditor.

	"Adding shortcut to Pyramid"
	spacePlugin resetShortcutBlock: [ :aSpace |
		self refreshAllShortcutInSpace: aSpace ].
	spacePlugin resetSpace
]

{ #category : #initialization }
PyramidSpaceShortcutManagerPlugin >> initialize [

	shortcutCollection := OrderedCollection new.
	collectionOfSpaceShortcutClass := self class allSubclasses collect: [ :class | class new ].
]

{ #category : #action }
PyramidSpaceShortcutManagerPlugin >> refreshAllShortcutInSpace: aSpace [
	
	self removeAllShortcutInSpace: aSpace.
	self addAllShortcutInSpace: aSpace.
	
	
]

{ #category : #removing }
PyramidSpaceShortcutManagerPlugin >> removeAllShortcutInSpace: aSpace [

	shortcutCollection do: [ :shortcut | aSpace root removeShortcut: shortcut ].
	shortcutCollection removeAll.
]

{ #category : #accessing }
PyramidSpaceShortcutManagerPlugin >> setupPluginOfShortcuts: aPyramidEditor [

	collectionOfSpaceShortcutClass do: [ :shortcutClass |
		shortcutClass pluginFromPyramid: aPyramidEditor ].
]
