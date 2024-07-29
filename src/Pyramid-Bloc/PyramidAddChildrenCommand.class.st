Class {
	#name : #PyramidAddChildrenCommand,
	#superclass : #PyramidChildrenCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'as yet unclassified' }
PyramidAddChildrenCommand >> commandInverse [

	^ PyramidRemoveChildrenCommand new
]

{ #category : #'as yet unclassified' }
PyramidAddChildrenCommand >> setValueFor: aBlElement with: aChildrenToAdd [

	aBlElement addChildren: aChildrenToAdd
]
