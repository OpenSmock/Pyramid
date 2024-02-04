Class {
	#name : #PyramidPositionOffsetCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidPositionOffsetCommand >> commandInverse [

	^ PyramidPositionCommand new
]

{ #category : #'as yet unclassified' }
PyramidPositionOffsetCommand >> getValueFor: aBlElement [

	^ aBlElement constraints position
]

{ #category : #'as yet unclassified' }
PyramidPositionOffsetCommand >> saveStatesOf: aCollection with: arguments [

	^ self saveStatesWithCommandInverseOf: aCollection with: arguments
]

{ #category : #'as yet unclassified' }
PyramidPositionOffsetCommand >> setValueFor: aBlElement with: anArgument [

	anArgument isPoint ifFalse: [ ^ self ].
	aBlElement constraints position:
		anArgument + aBlElement constraints position.
		aBlElement requestParentLayout
]
