Class {
	#name : #PyramidSpecShortcutElementToPositionZero,
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
PyramidSpecShortcutElementToPositionZero >> defaultKeyCombination [
	"CTRL + G to activate this shortcut"
	
	keyCombination := Character space command mac | Character space control unix | Character space control win
]

{ #category : #actions }
PyramidSpecShortcutElementToPositionZero >> elementPositionZeroAction [
	
	| element |
	plugin projectModel selection size = 1
	ifFalse: [ ^ self ].
	
	element := plugin projectModel selection first.
	
	plugin commandExecutor 
	use: PyramidPositionCommand new
		on: { element }
		with: 0@0.
]

{ #category : #'accessing - classes' }
PyramidSpecShortcutElementToPositionZero >> pluginFromPyramid: aPyramidEditor [
	
	plugin := aPyramidEditor
]

{ #category : #accessing }
PyramidSpecShortcutElementToPositionZero >> shortcutAction [

	shortcutAction := PyramidSpecShortcutActionObject new.
	^ shortcutAction
		  shortcut: keyCombination;
		  action: [
			  plugin
				  ifNil: [ self inform: 'problem with the projectModel shortcut ElementToPositionZero' ]
				  ifNotNil: [ self elementPositionZeroAction ] ]
]
