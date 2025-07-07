"
This class add to a treetable the possibilities to drag and drop one or many selected element to edit the tree structure of the targeted element.
"
Class {
	#name : #PyramidEditElementTreeDragAndDropPlugin,
	#superclass : #Object,
	#traits : 'TPyramidPlugin',
	#classTraits : 'TPyramidPlugin classTrait',
	#instVars : [
		'editor',
		'navigationPlugin',
		'navigationSelectionPanel',
		'navigationPresenter'
	],
	#category : #'Pyramid-Bloc-plugin-edit-element-tree'
}

{ #category : #adding }
PyramidEditElementTreeDragAndDropPlugin >> addEditElementTreeDragAndDrop [

	| selectionPanelTreeTable |

	selectionPanelTreeTable := navigationSelectionPanel treeTable.
	selectionPanelTreeTable dragEnabled: true;
				dropEnabled: true;
				acceptDrop: [ :transfer | 
					(transfer target)
						"Move dragged element to root space (workplace)"
						ifNil: [ self navigationPlugin removeSelectedElements.
									self moveElementToRootSpace: transfer passenger.
									self editor projectModel updateSelection.
									selectionPanelTreeTable expandAll.  ]
						"Move dragged element to targeted element"
						ifNotNil: [ (self canMoveSelectedElement: (transfer passenger) target: (transfer target))
										 "Dragged element put as a child of the targeted element"
										 ifTrue: [ self navigationPlugin removeSelectedElements.
													self moveElementDragToChild: transfer passenger
																					 target: transfer target.
													self editor projectModel updateSelection.
													selectionPanelTreeTable expandAll. ]
										 ifFalse: [ self inform: 'cannot move selected element to his child or himself'] ] ].
]

{ #category : #testing }
PyramidEditElementTreeDragAndDropPlugin >> canMoveSelectedElement: anArrayOfElementDragged target: aElementTarget [

	| canMove |
	canMove := true.
	
	anArrayOfElementDragged do: [ :element |
		aElementTarget = element ifTrue: [ ^ canMove := false ] ].
	
	canMove := (self checkParentOfTarget: aElementTarget
		  draggedBlElement: anArrayOfElementDragged).

	^ canMove
]

{ #category : #testing }
PyramidEditElementTreeDragAndDropPlugin >> checkParentOfTarget: aElementTarget draggedBlElement: anArrayOfElementDragged [
	
	aElementTarget hasParent 
	ifTrue: [ anArrayOfElementDragged do: [ :element | (aElementTarget parent = element)
																		ifTrue: [ ^ false ]
																		ifFalse: [ ^ (self checkParentOfTarget: (aElementTarget parent) 
																							draggedBlElement: anArrayOfElementDragged). ] ] ]
	ifFalse: [ ^ true ]
	
]

{ #category : #connecting }
PyramidEditElementTreeDragAndDropPlugin >> connectOn: aPyramidEditor [

	editor := aPyramidEditor.
	
	self navigationPluginFromPyramid: aPyramidEditor.
	self navigationPlugin ifNil: [ ^ self ].
	navigationPresenter := self navigationPlugin navigation.
	navigationSelectionPanel := navigationPresenter selectionPanel.
	self addEditElementTreeDragAndDrop.
]

{ #category : #accessing }
PyramidEditElementTreeDragAndDropPlugin >> editor [ 

	^ editor
]

{ #category : #initialization }
PyramidEditElementTreeDragAndDropPlugin >> initialize [ 
	
	"Do nothing"
]

{ #category : #actions }
PyramidEditElementTreeDragAndDropPlugin >> moveElementDragToChild: arrayOfElementDragged target: aElementTarget [

	self editor commandExecutor
		use: PyramidAddChildrenCommand new
		on: { aElementTarget }
		with: arrayOfElementDragged.
]

{ #category : #actions }
PyramidEditElementTreeDragAndDropPlugin >> moveElementToRootSpace: arrayOfElementDragged [

	self editor commandExecutor
		use: PyramidAddAllToCollectionCommand new
		on: { self editor projectModel firstLevelElements }
		with: arrayOfElementDragged.
]

{ #category : #accessing }
PyramidEditElementTreeDragAndDropPlugin >> navigationPlugin [

	^ navigationPlugin
]

{ #category : #accessing }
PyramidEditElementTreeDragAndDropPlugin >> navigationPlugin: aPlugin [

	navigationPlugin := aPlugin
]

{ #category : #accessing }
PyramidEditElementTreeDragAndDropPlugin >> navigationPluginFromPyramid: aPyramidEditor [

	self navigationPlugin: (aPyramidEditor findPlugin: PyramidNavigationPlugin).
]
