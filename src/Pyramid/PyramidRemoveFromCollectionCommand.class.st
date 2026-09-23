Class {
	#name : #PyramidRemoveFromCollectionCommand,
	#superclass : #PyramidCollectionCommand,
	#category : #'Pyramid-commands'
}

{ #category : #history }
PyramidRemoveFromCollectionCommand >> commandInverse [

	^ PyramidAddToCollectionCommand new
]

{ #category : #getter }
PyramidRemoveFromCollectionCommand >> getValueFor: anObject [

	^ nil
]

{ #category : #setter }
PyramidRemoveFromCollectionCommand >> setValueFor: anObject with: anArgument [

	anObject remove: anArgument
]
