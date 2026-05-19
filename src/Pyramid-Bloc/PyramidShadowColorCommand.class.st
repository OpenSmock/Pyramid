Class {
	#name : #PyramidShadowColorCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #testing }
PyramidShadowColorCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
			  anObject effect class = BlSimpleShadowEffect or: [
				  anObject effect class = BlGaussianShadowEffect ] ]
]

{ #category : #accessing }
PyramidShadowColorCommand >> getValueFor: aBlElement [

	(aBlElement effect class = BlSimpleShadowEffect or: [
		 aBlElement effect class = BlGaussianShadowEffect ]) ifFalse: [ ^ nil ].
	^ aBlElement effect color
]

{ #category : #accessing }
PyramidShadowColorCommand >> setValueFor: aBlElement with: aColor [

	(aBlElement effect class = BlSimpleShadowEffect or: [
		 aBlElement effect class = BlGaussianShadowEffect ]) ifFalse: [ ^ nil ].
	aBlElement effect: (aBlElement effect copyWithColor: aColor).
	PyramidShadowCommand current syncFromElement: aBlElement
]
