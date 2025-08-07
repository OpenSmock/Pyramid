"
This class is used to define the shortcut for inspect an selected element.
"
Class {
	#name : #PyramidSpecShortcutInspectSelectedElement,
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
PyramidSpecShortcutInspectSelectedElement >> defaultKeyCombination [
	"CTRL + I to activate this shortcut"

	keyCombination := $i command mac | $i control unix | $i control win
]

{ #category : #initialization }
PyramidSpecShortcutInspectSelectedElement >> initialize [

	self defaultKeyCombination
]

{ #category : #'accessing - classes' }
PyramidSpecShortcutInspectSelectedElement >> pluginFromPyramid: aPyramidEditor [

	plugin := aPyramidEditor projectModel
]

{ #category : #accessing }
PyramidSpecShortcutInspectSelectedElement >> shortcutAction [

	shortcutAction := PyramidSpecShortcutActionObject new.
	^ shortcutAction
		  shortcut: keyCombination;
		  action: [
			  plugin selection size = 1
				  ifTrue: [
					  plugin selection first inspect.
					  plugin updateSelection ]
				  ifFalse: [
					  self inform: 'Cannot inspect zero or multiple selected element' ] ]
]
