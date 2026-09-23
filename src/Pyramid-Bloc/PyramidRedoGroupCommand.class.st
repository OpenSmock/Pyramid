Class {
	#name : #PyramidRedoGroupCommand,
	#superclass : #PyramidCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-group'
}

{ #category : #history }
PyramidRedoGroupCommand >> commandInverse [

	^ PyramidUndoGroupCommand new
]

{ #category : #getter }
PyramidRedoGroupCommand >> getValueFor: aBlElement [

	^ nil
]

{ #category : #'as yet unclassified' }
PyramidRedoGroupCommand >> positionGroupElement: groupElement [

	| currentTop currentLeft |
	currentTop := groupElement children first constraints position y.
	currentLeft := groupElement children first constraints position x.
	groupElement childrenDo: [ :child |
		| childTop childLeft |
		childTop := child constraints position y.
		childLeft := child constraints position x.
		currentTop := currentTop min: childTop.
		currentLeft := currentLeft min: childLeft ].
	groupElement position: currentLeft @ currentTop.
	groupElement childrenDo: [ :child |
		child position:
			child constraints position - (currentLeft @ currentTop) ]
]

{ #category : #setter }
PyramidRedoGroupCommand >> setValueFor: aCollectionToGroup with: aGroupModel [

	| anyElementInFirstLevels |
	aGroupModel originElement removeChildren:
		aGroupModel selectionInCorrectOrder.
	aGroupModel groupElement addChildren:
		aGroupModel selectionInCorrectOrder.
	aGroupModel originElement addChild: aGroupModel groupElement.
	anyElementInFirstLevels := aGroupModel firstLevelElements removeAll:
		                           aGroupModel selectionInCorrectOrder.
	anyElementInFirstLevels ifNotEmpty: [
		aGroupModel firstLevelElements add: aGroupModel groupElement ].
	self positionGroupElement: aGroupModel groupElement.
]
