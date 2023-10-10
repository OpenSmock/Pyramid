Class {
	#name : #PyramidGroupCommand,
	#superclass : #PyramidAbstractGroupCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #testing }
PyramidGroupCommand >> canBeUsedFor: anObject [

	^ anObject isCollection and: [
		  anObject isNotEmpty and: [
			  | parent |
			  parent := anObject first parent.
			  anObject allSatisfy: [ :each | each parent = parent ] ] ]
]

{ #category : #'as yet unclassified' }
PyramidGroupCommand >> cleanUpRoots: roots forGroup: groupElement [

	(roots includesAny: groupElement children) ifFalse: [ ^ self ].
	roots removeAll: groupElement children.
	roots add: groupElement.
]

{ #category : #'as yet unclassified' }
PyramidGroupCommand >> commandInverse [

	^ PyramidGroupInverseCommand new
]

{ #category : #'as yet unclassified' }
PyramidGroupCommand >> makeGroupElement [

	^ BlElement new id: #group; clipChildren: false; yourself
]

{ #category : #'as yet unclassified' }
PyramidGroupCommand >> makeGroupElementFor: aCollection [

	| parent groupElement |
	"Remove any element from their parent. Add them to a ""group"" element. Then add the ""group"" to the parent."
	parent := aCollection first parent.
	parent ifNotNil: [ parent removeChildren: aCollection ].
	groupElement := self makeGroupElement.
	groupElement addChildren: aCollection.
	parent ifNotNil: [ parent addChild: groupElement ].

	^ groupElement
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

	| mementos |
	mementos := aCollection asArray collect: [ :each |
		            PyramidCommandMemento new
			            command: self;
			            target: each;
			            arguments: arguments;
			            yourself ].
	mementos size = 1 ifTrue: [ ^ mementos first ].
	^ PyramidCompositeMemento new
		  mementos: mementos;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidGroupCommand >> saveStatesWithCommandInverseOf: aCollection with: arguments [

	| mementos |
	mementos := aCollection asArray collect: [ :each |
		            PyramidCommandMemento new
			            command: self commandInverse;
			            target: each;
			            arguments: arguments;
			            yourself ].
	mementos size = 1 ifTrue: [ ^ mementos first ].
	^ PyramidCompositeMemento new
		  mementos: mementos;
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidGroupCommand >> setValueFor: aCollection with: roots [

	| groupElement |
	"Remove any element from their parent. Add them to a ""group"" element. Then add the ""group"" to the parent."
	groupElement := self makeGroupElementFor: aCollection.

	"update the position of the group to the most top/left element. Update all position by removing the group position to the element position"
self positionGroupElement: groupElement.

	"remove any roots elements from the roots collection and add the group insteed."
	self cleanUpRoots: roots forGroup: groupElement
]
