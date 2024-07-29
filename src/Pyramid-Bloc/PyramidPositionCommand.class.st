Class {
	#name : #PyramidPositionCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidPositionCommand >> getValueFor: aBlElement [

	^ aBlElement constraints position
]

{ #category : #'as yet unclassified' }
PyramidPositionCommand >> setValueFor: aBlElement with: anArgument [

	anArgument isPoint ifFalse: [ ^ self ].
	aBlElement constraints position: anArgument.
	aBlElement requestParentLayout
]
