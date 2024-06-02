Class {
	#name : 'PyramidBorderMiterLimitCommand',
	#superclass : 'PyramidAbstractBorderCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-visuals',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-visuals'
}

{ #category : 'testing' }
PyramidBorderMiterLimitCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  (anObject border style lineJoin isKindOf: BlStrokeLineMiterJoin) ]
]

{ #category : 'as yet unclassified' }
PyramidBorderMiterLimitCommand >> getValueFor: aBlElement [

	^ aBlElement border style miterLimit
]

{ #category : 'as yet unclassified' }
PyramidBorderMiterLimitCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder miterLimit: anArgument
]
