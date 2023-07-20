Class {
	#name : #NeoPyramidBackgroundCommand,
	#superclass : #NeoPyramidBlocCommand,
	#category : #'NeoPyramid-command'
}

{ #category : #'as yet unclassified' }
NeoPyramidBackgroundCommand >> getValueFor: aBlElement [

	^ aBlElement background
]

{ #category : #'as yet unclassified' }
NeoPyramidBackgroundCommand >> setValueFor: aBlElement with: anArgument [

	(anArgument class inheritsFrom: BlBackground) ifFalse: [^ self].
	aBlElement background: anArgument
]
