Class {
	#name : #PyramidUngroupCommand,
	#superclass : #PyramidAbstractGroupCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #testing }
PyramidUngroupCommand >> canBeUsedFor: anObject [

	^ anObject isCollection and: [
		  anObject isNotEmpty and: [
			  | parent |
			  parent := anObject first parent.
			parent isNotNil and: [ 
			  anObject allSatisfy: [ :each | each parent = parent ] ] ] ]
]

{ #category : #'as yet unclassified' }
PyramidUngroupCommand >> commandInverse [

	^ PyramidGroupCommand new
]

{ #category : #'as yet unclassified' }
PyramidUngroupCommand >> setValueFor: aCollection with: roots [

	| elements groupElement |
	groupElement := aCollection first parent.
	elements := groupElement children asArray.
	groupElement removeChildren.
	
	groupElement hasParent ifTrue: [ groupElement parent addChildren: elements.
		groupElement parent removeChild: groupElement ].
	
	(roots includes: groupElement) ifFalse: [ ^ self ].
	roots remove: groupElement.
	roots addAll: elements
]
