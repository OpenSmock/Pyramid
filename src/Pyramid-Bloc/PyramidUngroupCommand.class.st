Class {
	#name : #PyramidUngroupCommand,
	#superclass : #PyramidAbstractGroupCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #testing }
PyramidUngroupCommand >> canBeUsedFor: anObject [

	^ anObject isCollection and: [
		  anObject size = 1  ]
]

{ #category : #'as yet unclassified' }
PyramidUngroupCommand >> commandInverse [

	^ PyramidGroupCommand new
]

{ #category : #'as yet unclassified' }
PyramidUngroupCommand >> setValueFor: aCollection with: roots [

	| groupElement elements |
	groupElement := aCollection first.
	elements := groupElement removeChildren: aCollection.
	
	groupElement hasParent ifTrue: [ groupElement parent addChildren: elements ].
	
	(roots includes: groupElement) ifFalse: [ ^ self ].
	roots removeAll: groupElement.
	roots addAll: elements
]
