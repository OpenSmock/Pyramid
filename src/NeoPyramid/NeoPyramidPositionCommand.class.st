Class {
	#name : #NeoPyramidPositionCommand,
	#superclass : #NeoPyramidBlocCommand,
	#category : #'NeoPyramid-command'
}

{ #category : #'as yet unclassified' }
NeoPyramidPositionCommand >> getValueFor: aBlElement [

	^ aBlElement constraints position
]

{ #category : #'as yet unclassified' }
NeoPyramidPositionCommand >> setValueFor: aBlElement with: anArgument [

	anArgument isPoint ifFalse: [ ^ self ].
	aBlElement constraints position: anArgument.
	aBlElement requestParentLayout
]
