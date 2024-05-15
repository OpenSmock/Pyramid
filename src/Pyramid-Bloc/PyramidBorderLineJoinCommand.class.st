Class {
	#name : 'PyramidBorderLineJoinCommand',
	#superclass : 'PyramidAbstractBorderCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-background',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-background'
}

{ #category : 'as yet unclassified' }
PyramidBorderLineJoinCommand >> getValueFor: aBlElement [

	^ aBlElement border style lineJoin
]

{ #category : 'as yet unclassified' }
PyramidBorderLineJoinCommand >> updateBuilder: aBuilder with: anArgument [.
	aBuilder lineJoin: anArgument
]
