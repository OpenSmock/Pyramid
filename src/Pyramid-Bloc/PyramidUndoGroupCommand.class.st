Class {
	#name : #PyramidUndoGroupCommand,
	#superclass : #PyramidCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-group'
}

{ #category : #history }
PyramidUndoGroupCommand >> commandInverse [

	^ PyramidRedoGroupCommand new
]

{ #category : #getter }
PyramidUndoGroupCommand >> getValueFor: aBlElement [

	^ nil
]

{ #category : #'as yet unclassified' }
PyramidUndoGroupCommand >> positionChildrenOfGroupElement: groupElement [

	| currentTop currentLeft |
	currentTop := groupElement constraints position y.
	currentLeft := groupElement constraints position x.
	groupElement childrenDo: [ :child |
		child position:
			child constraints position + (currentLeft @ currentTop) ]
]

{ #category : #setter }
PyramidUndoGroupCommand >> setValueFor: aCollectionToGroup with: aGroupModel [
	"Remove children of group.
	Remove children of origin.
	Origin add original children.
	firstLevelElements add original firstLevelElements."

	self positionChildrenOfGroupElement: aGroupModel groupElement.
	aGroupModel groupElement removeChildren.
	aGroupModel originElement removeChildren.
	aGroupModel originElement addChildren:
		aGroupModel originalChildrenElements.
		aGroupModel firstLevelElements removeAll.
	aGroupModel firstLevelElements addAll:
		aGroupModel originFirstLevelElements
]
