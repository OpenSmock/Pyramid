Class {
	#name : 'PyramidAddToCollectionCommand',
	#superclass : 'PyramidCollectionCommand',
	#category : 'Pyramid-commands',
	#package : 'Pyramid',
	#tag : 'commands'
}

{ #category : 'as yet unclassified' }
PyramidAddToCollectionCommand >> commandInverse [

	^ PyramidRemoveFromCollectionCommand new
]

{ #category : 'as yet unclassified' }
PyramidAddToCollectionCommand >> getValueFor: anObject [

	^ nil
]

{ #category : 'as yet unclassified' }
PyramidAddToCollectionCommand >> setValueFor: anObject with: anArgument [

	anObject add: anArgument
]
