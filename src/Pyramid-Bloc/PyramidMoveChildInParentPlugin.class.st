"
This class is used to modify the place of child between each child in his parent.
"
Class {
	#name : #PyramidMoveChildInParentPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'editor',
		'projectModel',
		'contextMenuPlugin',
		'navigationPlugin'
	],
	#category : #'Pyramid-Bloc-plugin-edit-element-tree'
}

{ #category : #adding }
PyramidMoveChildInParentPlugin >> addPanelsOn: aPyramidSimpleWindow [
	
	aPyramidSimpleWindow
		at: #selectionMenu
		addItem: [ :builder | self contextMenuMoveChildInParent: builder ].
]

{ #category : #connecting }
PyramidMoveChildInParentPlugin >> connectOn: aPyramidEditor [

	editor := aPyramidEditor.
	projectModel := aPyramidEditor projectModel.
	self navigationFromPyramid: aPyramidEditor.
	
	aPyramidEditor
		addShortcutSpecInCollection: KeyboardKey pageUp
		action: [ self moveChildIndexUpInParent ]
		name: 'Shortcut spec move child index up'.
		
	aPyramidEditor
		addShortcutSpecInCollection: KeyboardKey pageDown
		action: [ self moveChildIndexDownInParent ]
		name: 'Shortcut spec move child index down'.
]

{ #category : #adding }
PyramidMoveChildInParentPlugin >> contextMenuMoveChildInParent: aBuilder [

	aBuilder
		addGroupSingleSelection: [ :group :single |
			group
				addItem: [ :item |
					item
						icon: (Smalltalk ui icons iconNamed: #up);
						name: 'Move index child up';
						action: [ self moveChildIndexUpInParent ];
						yourself ];

				addItem: [ :item |
					item
						icon: (Smalltalk ui icons iconNamed: #down);
						name: 'Move index child down';
						action: [ self moveChildIndexDownInParent ];
						yourself ];
				yourself ]
		order: 10.
]

{ #category : #accessing }
PyramidMoveChildInParentPlugin >> editor [ 

	^ editor
]

{ #category : #initialization }
PyramidMoveChildInParentPlugin >> initialize [ 

	"Do nothing"
]

{ #category : #'as yet unclassified' }
PyramidMoveChildInParentPlugin >> moveChildIndexDownCommand: aBlElementParent with: aBlElementChildToMove [

	self editor commandExecutor
		use: PyramidMoveChildIndexDownCommand new
		on: { aBlElementParent }
		with: aBlElementChildToMove
	
	
]

{ #category : #action }
PyramidMoveChildInParentPlugin >> moveChildIndexDownInParent [

	| childToMoveCollection childToMove childIndexToMove parentChild navigationSelectionPanel |
	
	childToMoveCollection := projectModel selection collection.
	navigationSelectionPanel := navigationPlugin navigation selectionPanel.
	
	childToMoveCollection size = 1
	ifFalse: [ ^ self ].
	childToMove := childToMoveCollection first.
	
	childToMove hasParent 
	ifFalse: [ ^ self ].
	parentChild := childToMove parent.
	
	childIndexToMove := (parentChild childIndexOf: childToMove).
	
	childIndexToMove > 1
		ifTrue: [ self moveChildIndexDownCommand: parentChild with: childToMove.
			self refreshTreeTable ]
		ifFalse: [ self inform: 'Cannot move down' ].

			
	

]

{ #category : #'as yet unclassified' }
PyramidMoveChildInParentPlugin >> moveChildIndexUpCommand: aBlElementParent with: aBlElementChildToMove [

	self editor commandExecutor
		use: PyramidMoveChildIndexUpCommand new
		on: { aBlElementParent }
		with: aBlElementChildToMove
	
]

{ #category : #action }
PyramidMoveChildInParentPlugin >> moveChildIndexUpInParent [

	| childToMoveCollection childToMove childIndexToMove parentChild navigationSelectionPanel |
	
	childToMoveCollection := projectModel selection collection.
	navigationSelectionPanel := navigationPlugin navigation selectionPanel.
	
	childToMoveCollection size = 1
	ifFalse: [ ^ self ].
	childToMove := childToMoveCollection first.
	
	childToMove hasParent 
	ifFalse: [ ^ self ].
	parentChild := childToMove parent.
	
	childIndexToMove := (parentChild childIndexOf: childToMove).
	
	childIndexToMove < (parentChild children size)
		ifTrue: [ self moveChildIndexUpCommand: parentChild with: childToMove.
			self refreshTreeTable ]
		ifFalse: [ self inform: 'Cannot move up' ].
			
	

]

{ #category : #accessing }
PyramidMoveChildInParentPlugin >> navigationFromPyramid: aPyramidEditor [
	
	navigationPlugin := aPyramidEditor findPlugin: PyramidNavigationPlugin.
]

{ #category : #'as yet unclassified' }
PyramidMoveChildInParentPlugin >> refreshTreeTable [
	
	| navigationSelectionPanel selectedItems |
	
	navigationSelectionPanel := navigationPlugin navigation selectionPanel.
	"Keep the selection on the movedChild from here"
	selectedItems := navigationSelectionPanel treeTable selectedItems first.
	navigationSelectionPanel treeTable unselectAll.
	"Refresh the treeTable"
	navigationSelectionPanel treeTable roots: navigationSelectionPanel treeTable roots.
	navigationSelectionPanel treeTable selectItem: selectedItems
]
