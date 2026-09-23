Class {
	#name : #PyramidPositionCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #getter }
PyramidPositionCommand >> getValueFor: aBlElement [

	^ aBlElement constraints position
]

{ #category : #setter }
PyramidPositionCommand >> setValueFor: aBlElement with: anArgument [

	anArgument isPoint ifFalse: [ ^ self ].
	aBlElement constraints position: anArgument.
	aBlElement requestParentLayout
]
