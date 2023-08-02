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
PyramidGroupCommand >> commandInverse [

	^ PyramidGroupInverseCommand new
]

{ #category : #'as yet unclassified' }
PyramidGroupCommand >> makeGroupElement [

	^ BlElement new id: #group; clipChildren: false; yourself
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

	| parent groupElement |
	parent := aCollection first parent.
	parent ifNotNil: [ parent removeChildren: aCollection ].
	groupElement := self makeGroupElement.
	groupElement addChildren: aCollection.
	parent ifNotNil: [ parent addChild: groupElement ].

	(roots includesAny: aCollection) ifFalse: [ ^ self ].
	roots removeAll: aCollection.
	roots add: groupElement
]
