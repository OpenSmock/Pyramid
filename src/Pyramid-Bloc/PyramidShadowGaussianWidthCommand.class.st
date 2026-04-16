Class {
	#name : #PyramidShadowGaussianWidthCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #testing }
PyramidShadowGaussianWidthCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject effect isKindOf: BlGaussianShadowEffect ]
]

{ #category : #accessing }
PyramidShadowGaussianWidthCommand >> getValueFor: aBlElement [

	^ (aBlElement effect isKindOf: BlGaussianShadowEffect) ifTrue: [aBlElement effect width] ifFalse: [ ^ self ]
]

{ #category : #accessing }
PyramidShadowGaussianWidthCommand >> setValueFor: aBlElement with: aWidth [

	(aBlElement effect isKindOf: BlGaussianShadowEffect)
		ifTrue: [
		aBlElement effect: (aBlElement effect copyWithWidth: aWidth) ]
		ifFalse: [ ^ self ].
	PyramidShadowCommand current syncFromElement: aBlElement
]
