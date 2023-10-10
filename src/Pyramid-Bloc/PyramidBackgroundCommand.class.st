Class {
	#name : 'PyramidBackgroundCommand',
	#superclass : 'PyramidAbstractBlocCommand',
	#category : 'Pyramid-Bloc-plugin-bloc',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc'
}

{ #category : 'as yet unclassified' }
PyramidBackgroundCommand >> getValueFor: aBlElement [

	^ aBlElement background
]

{ #category : 'as yet unclassified' }
PyramidBackgroundCommand >> setValueFor: aBlElement with: anArgument [

	(anArgument class inheritsFrom: BlBackground) ifFalse: [^ self].
	aBlElement background: anArgument
]
