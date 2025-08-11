"
This class is use to add shortcut to the spec in pyramid to use different feature.

To add new shortcut you just need to put the shortcut class to the subclasses of this current class with the trait (TPyramidShortcutSpec) and fill the different message.

You can take the PyramidSpecShortcutSave as example to do a new shortcut.

List of current active shortcut (default value) :
- Save -> ctrl + S
- Undo -> ctrl + Z
- Redo -> ctrl + Y
- Copy -> ctrl + C
- Paste -> ctrl + V
- Cut -> ctrl + X
- Grid visibility switch -> ctrl + G
- Select all element -> ctrl + A
- Unselect all element -> Escape
- Delete selected element -> ctrl + D
- Inspect one selected element -> ctrl + I
- Move child index Up -> ctrl + Arrow Up
- Move child index Down -> ctrl + Arrow Down
- Move element to position zero -> ctrl + Space
"
Class {
	#name : #PyramidSpecShortcutManagerPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'pyramidWindow',
		'collectionOfShortcutClass'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #adding }
PyramidSpecShortcutManagerPlugin >> addAllShortcutToSpecWindow [

	collectionOfShortcutClass do: [ :shortcutClass |
		pyramidWindow
			bindKeyCombination: shortcutClass shortcutAction shortcut
			toAction: shortcutClass shortcutAction action ]
]

{ #category : #initialization }
PyramidSpecShortcutManagerPlugin >> initialize [

	collectionOfShortcutClass := self class allSubclasses collect: [ :class | class new ].
]

{ #category : #accessing }
PyramidSpecShortcutManagerPlugin >> setupPluginOfShortcuts: aPyramidEditor [

	collectionOfShortcutClass do: [ :shortcutClass |
		shortcutClass pluginFromPyramid: aPyramidEditor ]
]

{ #category : #connecting }
PyramidSpecShortcutManagerPlugin >> windowOpenBy: aPyramidEditor [

	"The window to apply the shortcuts"
	pyramidWindow := aPyramidEditor window spec.

	"Apply the plugin in all shortcuts"
	self setupPluginOfShortcuts: aPyramidEditor.

	"Apply the shortcut in the spec window with the iteration of the collection"
	self addAllShortcutToSpecWindow
]
