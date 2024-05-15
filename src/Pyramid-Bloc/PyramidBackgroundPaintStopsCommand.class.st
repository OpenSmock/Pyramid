Class {
	#name : 'PyramidBackgroundPaintStopsCommand',
	#superclass : 'PyramidAbstractBlocCommand',
	#category : 'Pyramid-Bloc-plugin-bloc-background',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-background'
}

{ #category : 'testing' }
PyramidBackgroundPaintStopsCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  (anObject background isKindOf: BlPaintBackground) and: [
			  anObject background paint isKindOf: BlGradientPaint ] ]
]

{ #category : 'as yet unclassified' }
PyramidBackgroundPaintStopsCommand >> getValueFor: aBlElement [
	"We ensure that we are working with a copy of the associations."

	^ aBlElement background paint stops collect: [ :asso |
		  asso key copy -> asso value copy ]
]

{ #category : 'as yet unclassified' }
PyramidBackgroundPaintStopsCommand >> setValueFor: aBlElement with: anArgument [
	"We ensure that we are working with a copy of the associations."

	aBlElement background paint stops:
		(anArgument collect: [ :asso | asso key copy -> asso value copy ])
]
