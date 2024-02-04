Class {
	#name : #PyramidBackgroundPaintColorCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-background'
}

{ #category : #testing }
PyramidBackgroundPaintColorCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  (anObject background isKindOf: BlPaintBackground) and:
		  [anObject background paint class = BlColorPaint] ]
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPaintColorCommand >> getValueFor: aBlElement [

	^ aBlElement background paint color
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPaintColorCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background: (BlBackground paint: anArgument asBlPaint)
]
