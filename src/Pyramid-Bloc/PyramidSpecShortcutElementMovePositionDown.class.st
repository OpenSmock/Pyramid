Class {
	#name : #PyramidSpecShortcutElementMovePositionDown,
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
PyramidSpecShortcutElementMovePositionDown >> defaultKeyCombination [
	"ArrowDown to activate this shortcut"

	keyCombination := Character arrowDown
]

{ #category : #'as yet unclassified' }
PyramidSpecShortcutElementMovePositionDown >> elementPositionDownAction [
	
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
PyramidSpecShortcutElementMovePositionDown >> pluginFromPyramid: aPyramidEditor [
	
	plugin := aPyramidEditor
]

{ #category : #accessing }
PyramidSpecShortcutElementMovePositionDown >> shortcutAction [

	shortcutAction := PyramidSpecShortcutActionObject new.
	^ shortcutAction
		  shortcut: keyCombination;
		  action: [
			  plugin
				  ifNil: [ self inform: 'problem with the plugin' ]
				  ifNotNil: [ self elementPositionDownAction ] ]
]
