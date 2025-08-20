Class {
	#name : #PyramidSpaceShortcutElementMovePositionUp,
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
PyramidSpaceShortcutElementMovePositionUp >> defaultKeyCombination [
	"ArrowUp to activate this shortcut"

	keyCombination := (BlKeyCombination builder key: KeyboardKey up) build
]

{ #category : #'as yet unclassified' }
PyramidSpaceShortcutElementMovePositionUp >> elementPositionUpAction [
	
	| element newPosition |
	plugin projectModel selection size = 1
	ifFalse: [ ^ self ].
	
	element := plugin projectModel selection first.
	
	newPosition := ((element position x)@(element position y - 1)).
	
	plugin commandExecutor 
	use: PyramidPositionCommand new
		on: { element }
		with: newPosition.
]

{ #category : #'accessing - classes' }
PyramidSpaceShortcutElementMovePositionUp >> pluginFromPyramid: aPyramidEditor [
	
	plugin := aPyramidEditor
]

{ #category : #accessing }
PyramidSpaceShortcutElementMovePositionUp >> shortcutAction [

	^ shortcutAction := BlShortcutWithAction new
		                    name: 'Pyramid edition shortcut save';
		                    combination: keyCombination;
		                    action: [ :event |
			                    plugin
				                    ifNil: [ self inform: 'Problem with the projectModel'  ]
				                    ifNotNil: [ self elementPositionUpAction ] ]
]
