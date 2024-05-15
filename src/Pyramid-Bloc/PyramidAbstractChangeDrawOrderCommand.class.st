Class {
	#name : 'PyramidAbstractChangeDrawOrderCommand',
	#superclass : 'PyramidAbstractBlocCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-order',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-order'
}

{ #category : 'testing' }
PyramidAbstractChangeDrawOrderCommand class >> isAbstract [

	^ self == PyramidAbstractChangeDrawOrderCommand
]

{ #category : 'testing' }
PyramidAbstractChangeDrawOrderCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [ anObject hasParent]
]

{ #category : 'as yet unclassified' }
PyramidAbstractChangeDrawOrderCommand >> getValueFor: aBlElement [
	"return current index for testing."

	^ aBlElement parent childIndexOf: aBlElement
]
