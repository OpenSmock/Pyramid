Class {
	#name : #PyramidBackgroundPaintCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-background'
}

{ #category : #testing }
PyramidBackgroundPaintCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject background isKindOf: BlPaintBackground ]
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPaintCommand >> getGroupedValueFor: aBlElement [

	^ aBlElement background paint class
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPaintCommand >> getValueFor: aBlElement [

	^ aBlElement background paint
]

{ #category : #'as yet unclassified' }
PyramidBackgroundPaintCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background: (BlBackground paint: anArgument)
]
