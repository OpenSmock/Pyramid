Class {
	#name : #PyramidPlugin,
	#superclass : #Object,
	#category : #NeoPyramid
}

{ #category : #accessing }
PyramidPlugin >> leftElements [

	^ { PyramidTabElement random . PyramidTabElement random }
]

{ #category : #accessing }
PyramidPlugin >> rightElements [

	^ { PyramidTabElement random . PyramidTabElement random }
]

{ #category : #accessing }
PyramidPlugin >> topElements [

	^ {
		PyramidButton random.
		PyramidButton random.
		PyramidButton random.
		PyramidButton random.
		PyramidButton random }
]
