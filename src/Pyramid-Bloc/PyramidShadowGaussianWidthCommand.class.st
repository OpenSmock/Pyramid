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
		 aBlElement effect class = BlGaussianShadowEffect ])
		ifTrue: [ ^ aBlElement effect width ]
		ifFalse: [ ^ nil ]
]

{ #category : #accessing }
PyramidShadowGaussianWidthCommand >> setValueFor: aBlElement with: aWidth [

	(aBlElement effect class = BlSimpleShadowEffect or: [aBlElement effect class = BlGaussianShadowEffect])
		ifTrue: [
		aBlElement effect: (aBlElement effect copyWithWidth: aWidth) ]
		ifFalse: [ ^ nil ].
	PyramidShadowCommand current syncFromElement: aBlElement
]
