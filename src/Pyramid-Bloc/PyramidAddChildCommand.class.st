Class {
	#name : #PyramidAddChildCommand,
	#superclass : #PyramidChildrenCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #history }
PyramidAddChildCommand >> commandInverse [

	^ PyramidRemoveChildCommand new
]

{ #category : #private }
PyramidAddChildCommand >> savedIndexFor: aChild in: aParent [

	| index |
	index := aChild userData at: #removedAtIndex ifAbsent: [ 0 ].
	(index = 0 or: [ index > aParent children size ])
		ifTrue: [ ^ aParent children size + 1 ]
		ifFalse: [ ^ index ]
]

{ #category : #setter }
PyramidAddChildCommand >> setValueFor: aBlElement with: aChildToAdd [

	aBlElement
		addChild: aChildToAdd
		at: (self savedIndexFor: aChildToAdd in: aBlElement)
]
