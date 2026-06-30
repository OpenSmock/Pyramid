Class {
	#name : #PyramidBackgroundPaintColorCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #'as yet unclassified' }
PyramidBackgroundPaintColorCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  (anObject background isKindOf: BlPaintBackground) and: [
			  anObject background paint isKindOf: BlColorPaint ] ]
]

{ #category : #getter }
PyramidBackgroundPaintColorCommand >> getValueFor: aBlElement [

	^ aBlElement background paint color
]

{ #category : #setter }
PyramidBackgroundPaintColorCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background: (BlBackground paint: anArgument asBlPaint)
]
