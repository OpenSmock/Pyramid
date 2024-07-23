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

{ #category : #'as yet unclassified' }
PyramidBackgroundImageCommand >> getValueFor: aBlElement [

	^ aBlElement background image
]

{ #category : #'as yet unclassified' }
PyramidBackgroundImageCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background: (BlBackground image: anArgument)
]
