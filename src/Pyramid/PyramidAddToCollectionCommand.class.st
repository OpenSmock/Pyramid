Class {
	#name : #PyramidAddToCollectionCommand,
	#superclass : #PyramidCollectionCommand,
	#category : #'Pyramid-commands'
}

{ #category : #history }
PyramidAddToCollectionCommand >> commandInverse [

	^ PyramidRemoveFromCollectionCommand new
]

{ #category : #getter }
PyramidAddToCollectionCommand >> getValueFor: anObject [

	^ nil
]

{ #category : #setter }
PyramidAddToCollectionCommand >> setValueFor: anObject with: anArgument [

	anObject add: anArgument
]
