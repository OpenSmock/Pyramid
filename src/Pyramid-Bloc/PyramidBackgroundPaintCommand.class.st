Class {
	#name : #PyramidBackgroundPaintCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-visuals'
}

{ #category : #testing }
PyramidBackgroundPaintCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject background isKindOf: BlPaintBackground ]
]

{ #category : #getter }
PyramidBackgroundPaintCommand >> getGroupedValueFor: aBlElement [

	^ aBlElement background paint class
]

{ #category : #getter }
PyramidBackgroundPaintCommand >> getValueFor: aBlElement [

	^ aBlElement background paint
]

{ #category : #setter }
PyramidBackgroundPaintCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement background: (BlBackground paint: anArgument value)
]
