"
This class add the shortcut :
 - Move up child (ctrl + Arrow Up)
 - Move down child (ctrl + Arrow Down)
"
Class {
	#name : #PyramidSpaceShortcutMoveChildInParent,
	#superclass : #PyramidSpaceShortcutManagerPlugin,
	#instVars : [
		'moveChildInParentPlugin',
		'shortcutMoveUp',
		'keyCombinationMoveUp',
		'shortcutMoveDown',
		'keyCombinationMoveDown'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #accessing }
PyramidSpaceShortcutMoveChildInParent >> defaultKeyCombinationMoveDown [
	"CTRL + Arrow Down to activate this shortcut"
	keyCombinationMoveDown := ((BlKeyCombination builder primary key: KeyboardKey down) build)
]

{ #category : #accessing }
PyramidSpaceShortcutMoveChildInParent >> defaultKeyCombinationMoveUp [
	"CTRL + Arrow up to activate this shortcut"
	keyCombinationMoveUp := ((BlKeyCombination builder primary key: KeyboardKey up) build)
]

{ #category : #initialization }
PyramidSpaceShortcutMoveChildInParent >> initialize [ 

	self defaultKeyCombinationMoveUp.
	self defaultKeyCombinationMoveDown.
]

{ #category : #accessing }
PyramidSpaceShortcutMoveChildInParent >> keyCombinationMoveDown: aKeyCombination [

	keyCombinationMoveDown := aKeyCombination 
]

{ #category : #accessing }
PyramidSpaceShortcutMoveChildInParent >> keyCombinationMoveUp: aKeyCombination [

	keyCombinationMoveUp := aKeyCombination 
]

{ #category : #accessing }
PyramidSpaceShortcutMoveChildInParent >> moveChildInParentPluginFromPyramid: aPyramidEditor [

	moveChildInParentPlugin := aPyramidEditor findPlugin: PyramidMoveChildInParentPlugin.
]

{ #category : #accessing }
PyramidSpaceShortcutMoveChildInParent >> shortcutActionMoveDown [

	^ shortcutMoveDown := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut MoveDown';
			              combination: keyCombinationMoveDown;
			              action: [ :event | moveChildInParentPlugin 
														ifNil: [ self inform: 'Plugin MoveChildInParentPlugin is not installed' ]
														ifNotNil: [ moveChildInParentPlugin moveChildIndexDownInParent ] ]
]

{ #category : #accessing }
PyramidSpaceShortcutMoveChildInParent >> shortcutActionMoveUp [

	^ shortcutMoveUp := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut MoveUp';
			              combination: keyCombinationMoveUp;
			              action: [ :event | moveChildInParentPlugin 
														ifNil: [ self inform: 'Plugin MoveChildInParentPlugin is not installed' ]
														ifNotNil: [ moveChildInParentPlugin moveChildIndexUpInParent ] ]
]
