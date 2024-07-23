Class {
	#name : #PyramidBorderDashOffsetCommand,
	#superclass : #PyramidAbstractBorderCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #testing }
PyramidBorderDashOffsetCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject border style dashArray isNotEmpty ]
]

{ #category : #'as yet unclassified' }
PyramidBorderDashOffsetCommand >> getValueFor: aBlElement [

	^ aBlElement border style dashOffset
]

{ #category : #'as yet unclassified' }
PyramidBorderDashOffsetCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder dashOffset: anArgument
]
