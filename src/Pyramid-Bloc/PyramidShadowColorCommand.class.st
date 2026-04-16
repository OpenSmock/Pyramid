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

{ #category : #accessing }
PyramidShadowColorCommand >> getValueFor: aBlElement [

	(aBlElement effect isKindOf: BlShadowEffect)
		ifTrue: [ ^ aBlElement effect color ]
		ifFalse: [ ^ self ]
]

{ #category : #accessing }
PyramidShadowColorCommand >> setValueFor: aBlElement with: aColor [

	(aBlElement effect isKindOf: BlShadowEffect)
		ifTrue: [
		aBlElement effect: (aBlElement effect copyWithColor: aColor) ]
		ifFalse: [ ^ self ].
	PyramidShadowCommand current syncFromElement: aBlElement
]
