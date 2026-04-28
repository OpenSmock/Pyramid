Class {
	#name : #PyramidRemoveAllFromCollectionCommand,
	#superclass : #PyramidCollectionCommand,
	#category : #'Pyramid-commands'
}

{ #category : #history }
PyramidRemoveAllFromCollectionCommand >> commandInverse [

	^ PyramidAddAllToCollectionCommand new
]

{ #category : #getter }
PyramidRemoveAllFromCollectionCommand >> getValueFor: anObject [

	^ nil
]

{ #category : #setter }
PyramidRemoveAllFromCollectionCommand >> setValueFor: anObject with: anArgument [

	anObject removeAll: anArgument
]
