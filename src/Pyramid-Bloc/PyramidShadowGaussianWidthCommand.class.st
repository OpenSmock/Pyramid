Class {
	#name : #PyramidShadowGaussianWidthCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #testing }
PyramidShadowGaussianWidthCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject effect class = BlGaussianShadowEffect ]
]

{ #category : #accessing }
PyramidShadowGaussianWidthCommand >> getValueFor: aBlElement [

	(aBlElement effect class = BlSimpleShadowEffect or: [
		 aBlElement effect class = BlGaussianShadowEffect ]) ifFalse: [ ^ nil ].
	^ aBlElement effect width
]

{ #category : #accessing }
PyramidShadowGaussianWidthCommand >> setValueFor: aBlElement with: aWidth [

	(aBlElement effect class = BlSimpleShadowEffect or: [
		 aBlElement effect class = BlGaussianShadowEffect ]) ifFalse: [ ^ nil ].
	aBlElement effect: (aBlElement effect copyWithWidth: aWidth).
	PyramidShadowCommand current syncFromElement: aBlElement
]
