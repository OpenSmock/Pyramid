Class {
	#name : #PyramidMoveChildIndexUpCommand,
	#superclass : #PyramidMoveChildInParentCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #history }
PyramidMoveChildIndexUpCommand >> commandInverse [

	^ PyramidMoveChildIndexDownCommand new
]

{ #category : #setter }
PyramidMoveChildIndexUpCommand >> setValueFor: aBlElementParent with: aBlElementToMove [

	| childIndexToMove |
		
	childIndexToMove := aBlElementParent childIndexOf: aBlElementToMove.

	aBlElementParent
		swapChildAt: childIndexToMove
		with: childIndexToMove + 1
]
