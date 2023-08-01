Class {
	#name : #PyramidRemoveChildrenCommand,
	#superclass : #PyramidChildrenCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'as yet unclassified' }
PyramidRemoveChildrenCommand >> commandInverse [

	^ PyramidAddChildrenCommand new
]

{ #category : #'as yet unclassified' }
PyramidRemoveChildrenCommand >> setValueFor: aBlElement with: aChildToAdd [

	aBlElement removeChild: aChildToAdd
]
