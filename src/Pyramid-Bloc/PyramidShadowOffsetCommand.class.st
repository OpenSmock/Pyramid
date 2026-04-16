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

{ #category : #accessing }
PyramidShadowOffsetCommand >> getValueFor: aBlElement [

	^ (aBlElement effect isKindOf: BlShadowEffect) ifTrue: [aBlElement effect offset] ifFalse: [ ^ self ]
]

{ #category : #accessing }
PyramidShadowOffsetCommand >> setValueFor: aBlElement with: aPoint [

	(aBlElement effect isKindOf: BlShadowEffect)
		  ifTrue: [aBlElement effect: (aBlElement effect copyWithOffset: aPoint)] ifFalse: [^ self] .
	PyramidShadowCommand current syncFromElement: aBlElement
]
