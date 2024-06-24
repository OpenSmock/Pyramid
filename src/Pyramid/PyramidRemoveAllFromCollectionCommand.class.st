Class {
	#name : 'PyramidRemoveAllFromCollectionCommand',
	#superclass : 'PyramidCollectionCommand',
	#category : 'Pyramid-commands',
	#package : 'Pyramid',
	#tag : 'commands'
}

{ #category : 'as yet unclassified' }
PyramidRemoveAllFromCollectionCommand >> commandInverse [

	^ PyramidAddAllToCollectionCommand new
]

{ #category : 'as yet unclassified' }
PyramidRemoveAllFromCollectionCommand >> getValueFor: anObject [

	^ nil
]

{ #category : 'as yet unclassified' }
PyramidRemoveAllFromCollectionCommand >> setValueFor: anObject with: anArgument [

	anObject removeAll: anArgument
]
