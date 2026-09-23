Class {
	#name : #PyramidMoveChildIndexDownCommand,
	#superclass : #PyramidMoveChildInParentCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #history }
PyramidMoveChildIndexDownCommand >> commandInverse [

	^ PyramidMoveChildIndexUpCommand new
]

{ #category : #setter }
PyramidMoveChildIndexDownCommand >> setValueFor: aBlElementParent with: aBlElementToMove [

	| childIndexToMove |

	childIndexToMove := aBlElementParent childIndexOf: aBlElementToMove.

	aBlElementParent
		swapChildAt: childIndexToMove
		with: childIndexToMove - 1
]
