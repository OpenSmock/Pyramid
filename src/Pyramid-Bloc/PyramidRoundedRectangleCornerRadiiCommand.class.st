Class {
	#name : #PyramidRoundedRectangleCornerRadiiCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-Bloc-plugin-bloc-editor'
}

{ #category : #testing }
PyramidRoundedRectangleCornerRadiiCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
		  anObject geometry class = BlRoundedRectangleGeometry ]
]

{ #category : #getter }
PyramidRoundedRectangleCornerRadiiCommand >> getValueFor: aBlElement [

	^ aBlElement geometry cornerRadii
]

{ #category : #initialization }
PyramidRoundedRectangleCornerRadiiCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement geometry:
		(BlRoundedRectangleGeometry cornerRadii: anArgument)
]
