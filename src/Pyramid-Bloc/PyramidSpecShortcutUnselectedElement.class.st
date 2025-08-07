"
Class use to create the shortcut unselect all selected elements.
"
Class {
	#name : #PyramidSpecShortcutUnselectedElement,
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
PyramidSpecShortcutUnselectedElement >> defaultKeyCombination [
	"Escape to activate this shortcut"

	keyCombination :=  Character escape
]

{ #category : #initialization }
PyramidSpecShortcutUnselectedElement >> initialize [

	self defaultKeyCombination
]

{ #category : #'accessing - classes' }
PyramidSpecShortcutUnselectedElement >> pluginFromPyramid: aPyramidEditor [

	plugin := aPyramidEditor projectModel
]

{ #category : #accessing }
PyramidSpecShortcutUnselectedElement >> shortcutAction [

	shortcutAction := PyramidSpecShortcutActionObject new.
	^ shortcutAction
		  shortcut: keyCombination;
		  action: [
			  plugin
				  ifNil: [ self inform: 'problem with the project model' ]
				  ifNotNil: [ plugin updateSelection ] ]
]
