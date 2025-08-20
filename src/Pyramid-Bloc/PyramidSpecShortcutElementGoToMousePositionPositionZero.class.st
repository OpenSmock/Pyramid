Class {
	#name : #PyramidSpecShortcutElementGoToMousePositionPositionZero,
	#superclass : #PyramidSpecShortcutManagerPlugin,
	#traits : 'TPyramidShortcutSpec',
	#classTraits : 'TPyramidShortcutSpec classTrait',
	#instVars : [
		'plugin',
		'keyCombination',
		'shortcutAction',
		'editor'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #accessing }
PyramidSpecShortcutElementGoToMousePositionPositionZero >> defaultKeyCombination [
	"CTRL + Space to activate this shortcut"
	
	keyCombination := Character space command mac | Character space control unix | Character space control win
]

{ #category : #actions }
PyramidSpecShortcutElementGoToMousePositionPositionZero >> elementGoToMousePositionAction [
	
	| element |
	editor projectModel selection size = 1
	ifFalse: [ ^ self ].
	
	element := editor projectModel selection first.
	
	editor commandExecutor 
	use: PyramidPositionCommand new
		on: { element }
		with: plugin position.
]

{ #category : #'accessing - classes' }
PyramidSpecShortcutElementGoToMousePositionPositionZero >> pluginFromPyramid: aPyramidEditor [
	
	| spacePlugin extensionList extensionSorted listOfPlugins pluginSorted |
	
	listOfPlugins := aPyramidEditor plugins.
	pluginSorted := listOfPlugins select: [ :extensions | extensions isKindOf: PyramidSpacePlugin ].
	pluginSorted size = 1
	ifFalse: [^ self].
	spacePlugin := pluginSorted asArray first.

	extensionList := spacePlugin builder extensions.

	extensionSorted := extensionList select: [ :extensions |
		                           extensions isKindOf: PyramidPositionExtension ].
	extensionSorted size = 1 ifFalse: [ ^ self ].
	plugin := extensionSorted asArray first.
	
	editor := aPyramidEditor
]

{ #category : #accessing }
PyramidSpecShortcutElementGoToMousePositionPositionZero >> shortcutAction [

	shortcutAction := PyramidSpecShortcutActionObject new.
	^ shortcutAction
		  shortcut: keyCombination;
		  action: [
			  plugin
				  ifNil: [ self inform: 'problem with the projectModel shortcut ElementToPositionZero' ]
				  ifNotNil: [ self elementGoToMousePositionAction ] ]
]
