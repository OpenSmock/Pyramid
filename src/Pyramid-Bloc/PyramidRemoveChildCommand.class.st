Class {
	#name : #PyramidRemoveChildCommand,
	#superclass : #PyramidChildrenCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #history }
PyramidRemoveChildCommand >> commandInverse [

	^ PyramidAddChildCommand new
]

{ #category : #setter }
PyramidRemoveChildCommand >> setValueFor: aBlElement with: aChildToRemove [

	aBlElement removeChild: aChildToRemove
]
