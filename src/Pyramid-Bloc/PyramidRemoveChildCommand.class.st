Class {
	#name : #PyramidRemoveChildCommand,
	#superclass : #PyramidChildrenCommand,
	#category : #'Pyramid-Bloc-plugin-bloc'
}

{ #category : #history }
PyramidRemoveChildCommand >> commandInverse [

	^ PyramidAddChildCommand new
]

{ #category : #private }
PyramidRemoveChildCommand >> saveIndexOf: anElement [

	| index |
	index := anElement parent
		         ifNotNil: [ :p | p children indexOf: anElement ]
		         ifNil: [ 0 ].
	anElement userData at: #pyramidRemovedAtIndex put: index
]

{ #category : #setter }
PyramidRemoveChildCommand >> setValueFor: aBlElement with: aChildToRemove [
    self saveIndexOf: aChildToRemove.
    aBlElement removeChild: aChildToRemove.
]
