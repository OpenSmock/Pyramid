Class {
	#name : 'PyramidBorderPaintLinearDirectionCommand',
	#superclass : 'PyramidAbstractBorderCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-background',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-background'
}

{ #category : 'testing' }
PyramidBorderPaintLinearDirectionCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject border paint isKindOf: BlLinearGradientPaint ]
]
