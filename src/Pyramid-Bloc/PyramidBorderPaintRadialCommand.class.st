Class {
	#name : #PyramidBorderPaintRadialCommand,
	#superclass : #PyramidAbstractBorderCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #testing }
PyramidBorderPaintRadialCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject border paint isKindOf: BlRadialGradientPaint ]
]
