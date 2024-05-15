Class {
	#name : 'PyramidBackgroundPaintLinearDirectionCommand',
	#superclass : 'PyramidAbstractBlocCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-background',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-background'
}

{ #category : 'testing' }
PyramidBackgroundPaintLinearDirectionCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  (anObject background isKindOf: BlPaintBackground) and: [
			  anObject background paint isKindOf: BlLinearGradientPaint ] ]
]
