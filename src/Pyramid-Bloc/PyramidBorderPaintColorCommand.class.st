Class {
	#name : 'PyramidBorderPaintColorCommand',
	#superclass : 'PyramidAbstractBorderCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-visuals',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-visuals'
}

{ #category : 'testing' }
PyramidBorderPaintColorCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject border paint isKindOf: BlColorPaint ]
]

{ #category : 'as yet unclassified' }
PyramidBorderPaintColorCommand >> getValueFor: aBlElement [

	^ aBlElement border paint color
]

{ #category : 'as yet unclassified' }
PyramidBorderPaintColorCommand >> updateBuilder: aBuilder with: anArgument [

	aBuilder paint: anArgument asBlPaint
]
