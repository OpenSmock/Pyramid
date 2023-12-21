Class {
	#name : #PyramidGroupCommand,
	#superclass : #PyramidCommand,
	#instVars : [
		'historyCommandArguments'
	],
	#category : #'Pyramid-Bloc-plugin-bloc-group'
}

{ #category : #testing }
PyramidGroupCommand >> canBeUsedFor: aCollectionOfBlElements [

	| parent |
	aCollectionOfBlElements isCollection ifFalse: [ ^ false ].
	aCollectionOfBlElements ifEmpty: [ ^ false ].
	
	parent := aCollectionOfBlElements first parent.
	parent ifNil: [ ^ false ].
	^ aCollectionOfBlElements allSatisfy: [ :each |
				  each parent = parent ]
]

{ #category : #'as yet unclassified' }
PyramidGroupCommand >> commandInverse [
	"Command used to undo the group."

	^ PyramidUndoGroupCommand new 
]

{ #category : #'as yet unclassified' }
PyramidGroupCommand >> commandInverseArgumentsFor: aSelection and: aFirstLevelCollection [

	historyCommandArguments := PyramidGroupCommandModel new.
	historyCommandArguments originElement: aSelection first first parent.
	historyCommandArguments firstLevelElements: aFirstLevelCollection.
	historyCommandArguments originFirstLevelElements:
		aFirstLevelCollection asArray.
	historyCommandArguments originalChildrenElements:
		historyCommandArguments originElement children copy.
	historyCommandArguments selectionInCorrectOrder:
		(self orderGroup: aSelection first).
	^ self historyCommandArguments
]

{ #category : #'as yet unclassified' }
PyramidGroupCommand >> commandRestauration [
	"Command used to redo the group."

	^ PyramidRedoGroupCommand new
	
]

{ #category : #'as yet unclassified' }
PyramidGroupCommand >> commandRestaurationArgumentsFor: aSelection and: aFirstLevelCollection [

	self historyCommandArguments groupElement: aSelection first first parent.
	^ self historyCommandArguments
]

{ #category : #'as yet unclassified' }
PyramidGroupCommand >> createNewGroupElement: aCollectionOfBlElement [

	^ BlElement new
		  id: #group;
		  clipChildren: false;
		  addChildren: aCollectionOfBlElement;
		  yourself.
]

{ #category : #'as yet unclassified' }
PyramidGroupCommand >> getValueFor: aBlElement [

	^ self historyCommandArguments
]

{ #category : #accessing }
PyramidGroupCommand >> historyCommandArguments [

	^ historyCommandArguments
]

{ #category : #'as yet unclassified' }
PyramidGroupCommand >> orderGroup: aCollectionToGroup [

	"The group order must be the same as their parent children order."
	| parent |
	parent := aCollectionToGroup first parent.
	^ aCollectionToGroup sorted: [ :e1 :e2 | (parent childIndexOf: e1) < (parent childIndexOf: e2) ]
]

{ #category : #'as yet unclassified' }
PyramidGroupCommand >> positionGroupElement: groupElement [

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

{ #category : #'as yet unclassified' }
PyramidGroupCommand >> saveStatesOf: aCollection with: arguments [

	^ self
		  saveStatesOf: {aCollection}
		  withCommand: self commandRestauration
		  withArguments:
		  (self commandRestaurationArgumentsFor: aCollection and: arguments)
]

{ #category : #'as yet unclassified' }
PyramidGroupCommand >> saveStatesWithCommandInverseOf: aCollection with: arguments [

	^ self
		  saveStatesOf: {aCollection}
		  withCommand: self commandInverse
		  withArguments:
		  (self commandInverseArgumentsFor: aCollection and: arguments)
]

{ #category : #'as yet unclassified' }
PyramidGroupCommand >> setValueFor: aCollectionToGroup with: aCollectionOfFirstLevelElements [

	| groupInCorrectOrder parent groupElement removedElementFromFirstLevel |
	"First get aCollection to group on the correct order."
	groupInCorrectOrder := self orderGroup: aCollectionToGroup.

	"Second remove element from parent and firstLevel"
	parent := groupInCorrectOrder first parent.
	parent removeChildren: groupInCorrectOrder.
	removedElementFromFirstLevel := aCollectionOfFirstLevelElements
		                                removeAll: groupInCorrectOrder.

	"third create groupElement"
	groupElement := self createNewGroupElement: groupInCorrectOrder.

	"Last add groupElement to parent and to firstLevel if it come from it."
	parent addChild: groupElement.
	removedElementFromFirstLevel ifNotEmpty: [
		aCollectionOfFirstLevelElements add: groupElement ].
	
	"Set Correct position"
	self positionGroupElement: groupElement
]
