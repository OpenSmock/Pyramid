Class {
	#name : #PyramidSpaceShortcutElementMovePositionRight,
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
PyramidSpaceShortcutElementMovePositionRight >> defaultKeyCombination [
	"ArrowRight to activate this shortcut"

	keyCombination := (BlKeyCombination builder key: KeyboardKey right) build
]

{ #category : #'as yet unclassified' }
PyramidSpaceShortcutElementMovePositionRight >> elementPositionRightAction [
	
	| element newPosition |
	plugin projectModel selection size = 1
	ifFalse: [ ^ self ].
	
	element := plugin projectModel selection first.
	
	newPosition := ((element position x + 1)@(element position y)).
	
	plugin commandExecutor 
	use: PyramidPositionCommand new
		on: { element }
		with: newPosition.
]

{ #category : #'accessing - classes' }
PyramidSpaceShortcutElementMovePositionRight >> pluginFromPyramid: aPyramidEditor [
	
	plugin := aPyramidEditor
]

{ #category : #accessing }
PyramidSpaceShortcutElementMovePositionRight >> shortcutAction [

	^ shortcutAction := BlShortcutWithAction new
		                    name: 'Pyramid edition shortcut save';
		                    combination: keyCombination;
		                    action: [ :event |
			                    plugin
				                    ifNil: [ self inform: 'Problem with the projectModel' ]
				  						  ifNotNil: [ self elementPositionRightAction ] ]
]
