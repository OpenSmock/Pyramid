Class {
	#name : #PyramidBackgroundImageCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #testing }
PyramidBackgroundImageCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject background isKindOf: BlImageBackground ]
]

{ #category : #getter }
PyramidBackgroundImageCommand >> getValueFor: aBlElement [

	^ aBlElement background image
]

{ #category : #setter }
PyramidBackgroundImageCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background: (BlBackground image: anArgument)
]
