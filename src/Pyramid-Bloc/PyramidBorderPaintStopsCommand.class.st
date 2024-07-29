Class {
	#name : #PyramidBorderPaintStopsCommand,
	#superclass : #PyramidAbstractBorderCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #testing }
PyramidBorderPaintStopsCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
			  anObject border paint isKindOf: BlGradientPaint  ]
]

{ #category : #'as yet unclassified' }
PyramidBorderPaintStopsCommand >> getValueFor: aBlElement [
	"We ensure that we are working with a copy of the associations."

	^ aBlElement border paint stops collect: [ :asso |
		  asso key copy -> asso value copy ]
]

{ #category : #'as yet unclassified' }
PyramidBorderPaintStopsCommand >> updateBuilder: aBuilder with: anArgument [
	"We ensure that we are working with a copy of the associations."

	aBuilder paint stops:
		(anArgument collect: [ :asso | asso key copy -> asso value copy ])
]
