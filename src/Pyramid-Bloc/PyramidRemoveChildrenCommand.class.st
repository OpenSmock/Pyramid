Class {
	#name : 'PyramidRemoveChildrenCommand',
	#superclass : 'PyramidChildrenCommand',
	#category : 'Pyramid-Bloc-plugin-bloc',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc'
}

{ #category : 'as yet unclassified' }
PyramidRemoveChildrenCommand >> commandInverse [

	^ PyramidAddChildrenCommand new
]

{ #category : 'as yet unclassified' }
PyramidRemoveChildrenCommand >> setValueFor: aBlElement with: aChildrenToAdd [

	aBlElement addChildren: aChildrenToAdd
]
