Class {
	#name : #PyramidRemoveChildrenCommand,
	#superclass : #PyramidChildrenCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #history }
PyramidRemoveChildrenCommand >> commandInverse [

	^ PyramidAddChildrenCommand new
]

{ #category : #setter }
PyramidRemoveChildrenCommand >> setValueFor: aBlElement with: aChildrenToAdd [

	aBlElement removeChildren: aChildrenToAdd
]
