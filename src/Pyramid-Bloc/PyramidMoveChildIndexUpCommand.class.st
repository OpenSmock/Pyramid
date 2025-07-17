Class {
	#name : #PyramidMoveChildIndexUpCommand,
	#superclass : #PyramidChildrenCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'as yet unclassified' }
PyramidMoveChildIndexUpCommand >> commandInverse [

	^ PyramidMoveChildIndexDownCommand new
]

{ #category : #'as yet unclassified' }
PyramidMoveChildIndexUpCommand >> setValueFor: aBlElementParent with: aBlElementToMove [

	| childIndexToMove |
	childIndexToMove := aBlElementParent childIndexOf: aBlElementToMove.

	aBlElementParent
		swapChildAt: childIndexToMove
		with: childIndexToMove + 1
	
	
	"(aBlElementParent ""first"") swapChildAt: indexOfChildToMove with: (indexOfChildToMove + 1)"
]
