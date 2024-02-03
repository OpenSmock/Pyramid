Class {
	#name : #PyramidPaintBackgroundCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-background'
}

{ #category : #testing }
PyramidPaintBackgroundCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject background isKindOf: BlPaintBackground ]
]

{ #category : #'as yet unclassified' }
PyramidPaintBackgroundCommand >> getValueFor: aBlElement [

	^ aBlElement background paint
]

{ #category : #'as yet unclassified' }
PyramidPaintBackgroundCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background: (BlBackground paint: anArgument)
]
