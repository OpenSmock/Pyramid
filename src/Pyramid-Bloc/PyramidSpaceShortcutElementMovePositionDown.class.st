Class {
	#name : #PyramidSpaceShortcutElementMovePositionDown,
	#superclass : #PyramidSpaceShortcutManagerPlugin,
	#traits : 'TPyramidShortcutSpace',
	#classTraits : 'TPyramidShortcutSpace classTrait',
	#instVars : [
		'plugin',
		'keyCombination',
		'shortcutAction'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #accessing }
PyramidSpaceShortcutElementMovePositionDown >> defaultKeyCombination [
	"ArrowDown to activate this shortcut"

	keyCombination := (BlKeyCombination builder key: KeyboardKey down) build
]

{ #category : #'as yet unclassified' }
PyramidSpaceShortcutElementMovePositionDown >> elementPositionDownAction [
	
	| element newPosition |
	plugin projectModel selection size = 1
	ifFalse: [ ^ self ].
	
	element := plugin projectModel selection first.
	
	newPosition := ((element position x)@(element position y + 1)).
	
	plugin commandExecutor 
	use: PyramidPositionCommand new
		on: { element }
		with: newPosition.
]

{ #category : #'accessing - classes' }
PyramidSpaceShortcutElementMovePositionDown >> pluginFromPyramid: aPyramidEditor [
	
	plugin := aPyramidEditor
]

{ #category : #accessing }
PyramidSpaceShortcutElementMovePositionDown >> shortcutAction [

	^ shortcutAction := BlShortcutWithAction new
		                    name: 'Pyramid edition shortcut save';
		                    combination: keyCombination;
		                    action: [ :event |
			                    plugin
				                    ifNil: [ self inform: 'Problem with the projectModel' ]
				  						  ifNotNil: [ self elementPositionDownAction ] ]
]
