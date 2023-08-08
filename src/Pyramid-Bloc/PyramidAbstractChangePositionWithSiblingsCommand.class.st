Class {
	#name : #PyramidAbstractChangePositionWithSiblingsCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-siblings'
}

{ #category : #testing }
PyramidAbstractChangePositionWithSiblingsCommand class >> isAbstract [

	^ self == PyramidAbstractChangePositionWithSiblingsCommand
]

{ #category : #testing }
PyramidAbstractChangePositionWithSiblingsCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [ anObject hasParent ]
]

{ #category : #'as yet unclassified' }
PyramidAbstractChangePositionWithSiblingsCommand >> commandInverse [

	^ PyramidSendAtIndexCommand new
]

{ #category : #'as yet unclassified' }
PyramidAbstractChangePositionWithSiblingsCommand >> getValueFor: aBlElement [

	^ PyramidChangePositionWithSiblingsModel new
		  zIndex: aBlElement elevation elevation;
		  childIndex: (aBlElement parent childIndexOf: aBlElement);
		  yourself
]

{ #category : #'as yet unclassified' }
PyramidAbstractChangePositionWithSiblingsCommand >> saveStatesOf: aCollection with: arguments [

	^ self
		  saveStatesOf: aCollection
		  withCommand: self commandInverse
		  withArguments: arguments
]
