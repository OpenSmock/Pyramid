Class {
	#name : #PyramidMoveChildIndexDownCommand,
	#superclass : #PyramidMoveChildInParentCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #'as yet unclassified' }
PyramidMoveChildIndexDownCommand >> commandInverse [

	^ PyramidMoveChildIndexUpCommand new
]

{ #category : #'as yet unclassified' }
PyramidMoveChildIndexDownCommand >> setValueFor: aBlElementParent with: aBlElementToMove [

	| childIndexToMove |
	childIndexToMove := aBlElementParent childIndexOf: aBlElementToMove.

	aBlElementParent
		swapChildAt: childIndexToMove
		with: childIndexToMove - 1
]
