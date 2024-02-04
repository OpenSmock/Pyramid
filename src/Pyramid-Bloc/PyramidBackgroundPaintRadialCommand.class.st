Class {
	#name : #PyramidBackgroundPaintRadialCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-background'
}

{ #category : #testing }
PyramidBackgroundPaintRadialCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  (anObject background isKindOf: BlPaintBackground) and: [
			  anObject background paint isKindOf: BlRadialGradientPaint ] ]
]
