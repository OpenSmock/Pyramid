Class {
	#name : #PyramidRoundedRectangleCornerRadiiCommand,
	#superclass : #PyramidAbstractBlocCommand,
	#category : #'Pyramid-plugin-element'
}

{ #category : #testing }
PyramidRoundedRectangleCornerRadiiCommand >> canBeUsedFor: anObject [

	^ (super canBeUsedFor: anObject) and: [
			  anObject class = BlElement and: [
				  anObject geometry class = BlRoundedRectangleGeometry ] ]
]

{ #category : #getter }
PyramidRoundedRectangleCornerRadiiCommand >> getValueFor: aBlElement [

	^ aBlElement geometry cornerRadii
]

{ #category : #setter }
PyramidRoundedRectangleCornerRadiiCommand >> setValueFor: aBlElement with: anArgument [

	aBlElement geometry: (BlRoundedRectangleGeometry cornerRadii: anArgument)
]
