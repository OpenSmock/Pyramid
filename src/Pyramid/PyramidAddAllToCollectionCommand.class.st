Class {
	#name : #PyramidAddAllToCollectionCommand,
	#superclass : #PyramidCollectionCommand,
	#category : 'Pyramid-commands'
}

{ #category : #'as yet unclassified' }
PyramidAddAllToCollectionCommand >> commandInverse [

	^ PyramidRemoveAllFromCollectionCommand new
]

{ #category : #'as yet unclassified' }
PyramidAddAllToCollectionCommand >> getValueFor: anObject [

	^ nil
]

{ #category : #'as yet unclassified' }
PyramidAddAllToCollectionCommand >> setValueFor: anObject with: anArgument [

	anObject addAll: anArgument
]
