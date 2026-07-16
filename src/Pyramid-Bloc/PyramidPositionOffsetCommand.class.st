Class {
	#name : #PyramidPositionOffsetCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #history }
PyramidPositionOffsetCommand >> commandInverse [

	^ PyramidPositionCommand new
]

{ #category : #getter }
PyramidPositionOffsetCommand >> getValueFor: aBlElement [

	^ aBlElement constraints position
]

{ #category : #history }
PyramidPositionOffsetCommand >> saveStatesOf: aCollection with: arguments [

	^ self saveStatesWithCommandInverseOf: aCollection with: arguments
]

{ #category : #setter }
PyramidPositionOffsetCommand >> setValueFor: aBlElement with: anArgument [

	anArgument isPoint ifFalse: [ ^ self ].
	aBlElement constraints position:
		anArgument + aBlElement constraints position.
		aBlElement requestParentLayout
]
