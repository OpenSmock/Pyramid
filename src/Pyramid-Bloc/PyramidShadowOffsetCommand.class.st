Class {
	#name : #PyramidShadowOffsetCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #testing }
PyramidShadowOffsetCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject effect class = BlSimpleShadowEffect or: [anObject effect class = BlGaussianShadowEffect] ]
]

{ #category : #accessing }
PyramidShadowOffsetCommand >> getValueFor: aBlElement [

	(aBlElement effect class = BlSimpleShadowEffect or: [aBlElement effect class = BlGaussianShadowEffect])
		  ifTrue: [ ^ aBlElement effect offset ]
		  ifFalse: [ ^ nil ]
]

{ #category : #accessing }
PyramidShadowOffsetCommand >> setValueFor: aBlElement with: aPoint [

	(aBlElement effect class = BlSimpleShadowEffect or: [aBlElement effect class = BlGaussianShadowEffect])
		ifTrue: [
		aBlElement effect: (aBlElement effect copyWithOffset: aPoint) ]
		ifFalse: [ ^ nil ].
	PyramidShadowCommand current syncFromElement: aBlElement
]
