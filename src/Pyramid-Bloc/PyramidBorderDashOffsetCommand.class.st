Class {
	#name : 'PyramidBorderDashOffsetCommand',
	#superclass : 'PyramidAbstractBorderCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-background',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-background'
}

{ #category : 'testing' }
PyramidBorderDashOffsetCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject border style dashArray isNotEmpty ]
]

{ #category : 'as yet unclassified' }
PyramidBorderDashOffsetCommand >> getValueFor: aBlElement [

	^ aBlElement border style dashOffset
]

{ #category : 'as yet unclassified' }
PyramidBorderDashOffsetCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder dashOffset: anArgument
]
