Class {
	#name : #PyramidSpaceShortcutElementMovePositionLeft,
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
PyramidSpaceShortcutElementMovePositionLeft >> defaultKeyCombination [
	"ArrowLeft to activate this shortcut"

	keyCombination := (BlKeyCombination builder key: KeyboardKey left) build
]

{ #category : #'as yet unclassified' }
PyramidSpaceShortcutElementMovePositionLeft >> elementPositionLeftAction [
	
	| element newPosition |
	plugin projectModel selection size = 1
	ifFalse: [ ^ self ].
	
	element := plugin projectModel selection first.
	
	newPosition := ((element position x - 1)@(element position y)).
	
	plugin commandExecutor 
	use: PyramidPositionCommand new
		on: { element }
		with: newPosition.
]

{ #category : #'accessing - classes' }
PyramidSpaceShortcutElementMovePositionLeft >> pluginFromPyramid: aPyramidEditor [
	
	plugin := aPyramidEditor
]

{ #category : #accessing }
PyramidSpaceShortcutElementMovePositionLeft >> shortcutAction [

	^ shortcutAction := BlShortcutWithAction new
		                    name: 'Pyramid edition shortcut save';
		                    combination: keyCombination;
		                    action: [ :event |
			                    plugin
				                    ifNil: [ self inform: 'Problem with the projectModel' ]
				  						  ifNotNil: [ self elementPositionLeftAction ] ]
]
