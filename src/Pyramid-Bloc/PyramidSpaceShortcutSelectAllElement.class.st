"
This class used to create shortcut for select all element or all children from one selected element in Pyramid space.
"
Class {
	#name : #PyramidSpaceShortcutSelectAllElement,
	#superclass : #PyramidSpaceShortcutManagerPlugin,
	#instVars : [
		'keyCombinationSelectAll',
		'shortcutSelectAll',
		'projectModel'
	],
	#category : #'Pyramid-Bloc-plugin-shortcut-manager'
}

{ #category : #accessing }
PyramidSpaceShortcutSelectAllElement >> defaultKeyCombinationSelectAll [
	"CTRL + A to activate this shortcut"
	keyCombinationSelectAll := ((BlKeyCombination builder primary key: KeyboardKey A) build)
]

{ #category : #initialization }
PyramidSpaceShortcutSelectAllElement >> initialize [

	self defaultKeyCombinationSelectAll 
]

{ #category : #'accessing - classes' }
PyramidSpaceShortcutSelectAllElement >> projectModelFromPyramid: aPyramidEditor [

	projectModel := aPyramidEditor projectModel.
]

{ #category : #action }
PyramidSpaceShortcutSelectAllElement >> selectAll [

	projectModel selection asArray isEmpty
		ifTrue: [ self selectAllElementInSpace ].
	projectModel selection asArray size = 1
		ifTrue: [ self selectAllChildrenOfSelectedElement ].
]

{ #category : #action }
PyramidSpaceShortcutSelectAllElement >> selectAllChildrenOfSelectedElement [
	
	(projectModel selection collection asArray first) children isEmpty
	ifTrue: [ self inform: 'No children to select in the selected element' ]
	ifFalse: [ projectModel setSelection: (projectModel selection collection asArray first) children ]
	
]

{ #category : #action }
PyramidSpaceShortcutSelectAllElement >> selectAllElementInSpace [

	projectModel setSelection: projectModel firstLevelElements collection
]

{ #category : #accessing }
PyramidSpaceShortcutSelectAllElement >> shortcutActionSelectAll [

	^ shortcutSelectAll := BlShortcutWithAction new
			              name: 'Pyramid edition shortcut to select all element in space';
			              combination: keyCombinationSelectAll;
			              action: [ :event | projectModel ifNil: [ self inform: 'problem with the project model' ]
																		ifNotNil: [  self selectAll ] ]
]
