Class {
	#name : 'PyramidUndoGroupCommand',
	#superclass : 'PyramidCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-group',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-group'
}

{ #category : 'as yet unclassified' }
PyramidUndoGroupCommand >> commandInverse [

	^ PyramidRedoGroupCommand new
]

{ #category : 'as yet unclassified' }
PyramidUndoGroupCommand >> getValueFor: aBlElement [

	^ nil
]

{ #category : 'as yet unclassified' }
PyramidUndoGroupCommand >> positionChildrenOfGroupElement: groupElement [

	| currentTop currentLeft |
	currentTop := groupElement constraints position y.
	currentLeft := groupElement constraints position x.
	groupElement childrenDo: [ :child |
		child position:
			child constraints position + (currentLeft @ currentTop) ]
]

{ #category : 'as yet unclassified' }
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
