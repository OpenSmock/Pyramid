Class {
	#name : #PyramidSpecShortcutElementMovePositionLeft,
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
PyramidSpecShortcutElementMovePositionLeft >> defaultKeyCombination [
	"ArrowLeft to activate this shortcut"

	keyCombination := Character arrowLeft
]

{ #category : #'as yet unclassified' }
PyramidSpecShortcutElementMovePositionLeft >> elementPositionLeftAction [
	
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
PyramidSpecShortcutElementMovePositionLeft >> pluginFromPyramid: aPyramidEditor [
	
	plugin := aPyramidEditor
]

{ #category : #accessing }
PyramidSpecShortcutElementMovePositionLeft >> shortcutAction [

	shortcutAction := PyramidSpecShortcutActionObject new.
	^ shortcutAction
		  shortcut: keyCombination;
		  action: [
			  plugin
				  ifNil: [ self inform: 'problem with the plugin' ]
				  ifNotNil: [ self elementPositionLeftAction ] ]
]
