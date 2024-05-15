Class {
	#name : 'PyramidBorderPaintColorCommand',
	#superclass : 'PyramidAbstractBorderCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-background',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-background'
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

	aBuilder paint color: anArgument asBlPaint
]
