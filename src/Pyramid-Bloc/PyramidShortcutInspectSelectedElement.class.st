Class {
	#name : #PyramidShortcutInspectSelectedElement,
	#superclass : #PyramidSpaceShortcutManagerPlugin,
	#instVars : [
		'projectModel',
		'keyCombinationInspect',
		'shortcutInspect'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #accessing }
PyramidShortcutInspectSelectedElement >> defaultKeyCombinationInspect [
	"CTRL + S to activate this shortcut"
	keyCombinationInspect := ((BlKeyCombination builder primary key: KeyboardKey I) build)
]

{ #category : #initialization }
PyramidShortcutInspectSelectedElement >> initialize [ 

	self defaultKeyCombinationInspect.
]

{ #category : #accessing }
PyramidShortcutInspectSelectedElement >> keyCombinationInspect: aKeyCombination [
	
	^ keyCombinationInspect := aKeyCombination
]

{ #category : #'accessing - classes' }
PyramidShortcutInspectSelectedElement >> projectModelFromPyramid: aPyramidEditor [

	projectModel := aPyramidEditor projectModel
]

{ #category : #accessing }
PyramidShortcutInspectSelectedElement >> shortcutActionInspect [

	^ shortcutInspect := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut save';
			              combination: keyCombinationInspect;
			              action: [ :event | projectModel selection size = 1
														ifTrue: [ (projectModel selection first) inspect ]
														ifFalse: [ self inform: 'Cannot inspect zero or multiple selected element' ] ]
]
