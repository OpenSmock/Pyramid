Class {
	#name : #PyramidAddAllToCollectionCommand,
	#superclass : #PyramidCollectionCommand,
	#category : #'Pyramid-commands'
}

{ #category : #history }
PyramidAddAllToCollectionCommand >> commandInverse [

	^ PyramidRemoveAllFromCollectionCommand new
]

{ #category : #getter }
PyramidAddAllToCollectionCommand >> getValueFor: anObject [

	^ nil
]

{ #category : #setter }
PyramidAddAllToCollectionCommand >> setValueFor: anObject with: anArgument [

	anObject addAll: anArgument
]
