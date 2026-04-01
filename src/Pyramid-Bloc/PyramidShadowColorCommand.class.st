Class {
	#name : #PyramidShadowColorCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #testing }
PyramidShadowColorCommand >> canBeUsedFor: anObject [
    ^ (super canBeUsedFor: anObject) and: [
        anObject effect isKindOf: BlShadowEffect ]
]

{ #category : #'as yet unclassified' }
PyramidShadowColorCommand >> getValueFor: aBlElement [
    ^ aBlElement effect color
]

{ #category : #initialization }
PyramidShadowColorCommand >> setValueFor: aBlElement with: aColor [
    aBlElement effect: (aBlElement effect copyWithColor: aColor)
]
