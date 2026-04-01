Class {
	#name : #PyramidGaussianShadowWidthCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #testing }
PyramidGaussianShadowWidthCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject effect isKindOf: BlGaussianShadowEffect ]
]

{ #category : #'as yet unclassified' }
PyramidGaussianShadowWidthCommand >> getValueFor: aBlElement [

	^ aBlElement effect width
]

{ #category : #'as yet unclassified' }
PyramidGaussianShadowWidthCommand >> setValueFor: aBlElement with: aValue [

	aBlElement effect: (aBlElement effect copyWithWidth: aValue)
]
