Class {
	#name : #PyramidShadowOffsetCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #testing }
PyramidShadowOffsetCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject effect isKindOf: BlShadowEffect ]
]

{ #category : #'as yet unclassified' }
PyramidShadowOffsetCommand >> getValueFor: aBlElement [

	^ aBlElement effect offset
]

{ #category : #'as yet unclassified' }
PyramidShadowOffsetCommand >> setValueFor: aBlElement with: aPoint [
    aBlElement effect: (aBlElement effect copyWithOffset: aPoint).
    PyramidShadowCommand current syncFromElement: aBlElement
]
