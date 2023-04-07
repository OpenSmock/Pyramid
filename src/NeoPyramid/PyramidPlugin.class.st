Class {
	#name : #PyramidPlugin,
	#superclass : #Object,
	#category : #NeoPyramid
}

{ #category : #accessing }
PyramidPlugin >> leftElements [

	^ { PyramidTab random . PyramidTab random }
]

{ #category : #accessing }
PyramidPlugin >> rightElements [

	^ { PyramidTab random . PyramidTab random }
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
