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
]

{ #category : #adding }
PyramidMoveChildInParentPlugin >> contextMenuMoveChildInParent: aBuilder [

	aBuilder
		addGroupSingleSelection: [ :group :single |
			group
				addItem: [ :item |
					item
						icon: (Smalltalk ui icons iconNamed: #up);
						name: 'Move child up';
						action: [ self moveUpChildIndexInParent ];
						yourself ];

				addItem: [ :item |
					item
						icon: (Smalltalk ui icons iconNamed: #down);
						name: 'Move child down';
						action: [ self moveDownChildIndexInParent ];
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

{ #category : #action }
PyramidMoveChildInParentPlugin >> moveDownChildIndexInParent [

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
		ifTrue: [ parentChild swapChildAt: childIndexToMove with: (childIndexToMove + 1).
		"Keep the selection on the movedChild from here"
			navigationSelectionPanel treeTable unselectAll.
			"Refresh the treeTable and select the element moved"
			navigationSelectionPanel treeTable roots: navigationSelectionPanel treeTable roots.
			navigationSelectionPanel treeTable selectItem: childToMove. ]
		"to here"
		
		ifFalse: [ self inform: 'Cannot move down' ].
			
	

]

{ #category : #action }
PyramidMoveChildInParentPlugin >> moveUpChildIndexInParent [

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
		ifTrue: [ parentChild swapChildAt: childIndexToMove with: (childIndexToMove - 1).
		"Keep the selection on the movedChild from here"
			navigationSelectionPanel treeTable unselectAll.
			"Refresh the treeTable"
			navigationSelectionPanel treeTable roots: navigationSelectionPanel treeTable roots.
			navigationSelectionPanel treeTable selectItem: childToMove ]
		"to here"
		ifFalse: [ self inform: 'Cannot move up' ].

			
	

]

{ #category : #accessing }
PyramidMoveChildInParentPlugin >> navigationFromPyramid: aPyramidEditor [
	
	navigationPlugin := aPyramidEditor findPlugin: PyramidNavigationPlugin.
]
