Class {
	#name : 'PyramidRemoveFromCollectionCommand',
	#superclass : 'PyramidCollectionCommand',
	#category : 'Pyramid-commands',
	#package : 'Pyramid',
	#tag : 'commands'
}

{ #category : 'as yet unclassified' }
PyramidRemoveFromCollectionCommand >> commandInverse [

	^ PyramidAddToCollectionCommand new
]

{ #category : 'as yet unclassified' }
PyramidRemoveFromCollectionCommand >> getValueFor: anObject [

	^ nil
]

{ #category : 'as yet unclassified' }
PyramidRemoveFromCollectionCommand >> setValueFor: anObject with: anArgument [

	anObject remove: anArgument
]
