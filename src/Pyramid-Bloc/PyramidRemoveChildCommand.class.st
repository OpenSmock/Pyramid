Class {
	#name : #PyramidRemoveChildCommand,
	#superclass : #PyramidChildrenCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'as yet unclassified' }
PyramidRemoveChildCommand >> commandInverse [

	^ PyramidAddChildCommand new
]

{ #category : #'as yet unclassified' }
PyramidRemoveChildCommand >> setValueFor: aBlElement with: aChildToRemove [

	aBlElement removeChild: aChildToRemove
]
