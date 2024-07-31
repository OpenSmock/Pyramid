Class {
	#name : #PyramidRoundedRectangleCornerRadiiCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-geometry'
}

{ #category : #testing }
PyramidRoundedRectangleCornerRadiiCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject geometry class = BlRoundedRectangleGeometry ]
]

{ #category : #'as yet unclassified' }
PyramidRoundedRectangleCornerRadiiCommand >> getValueFor: aBlElement [

	^ aBlElement geometry cornerRadii
]

{ #category : #'as yet unclassified' }
PyramidRoundedRectangleCornerRadiiCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement geometry: (BlRoundedRectangleGeometry cornerRadii: anArgument)
]
