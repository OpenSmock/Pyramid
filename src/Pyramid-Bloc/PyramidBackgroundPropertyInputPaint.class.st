Class {
	#name : #PyramidBackgroundPropertyInputPaint,
	#superclass : #PyramidBackgroundPropertyInputStrategy,
	#instVars : [
		'preview'
	],
	#category : #'Pyramid-Bloc-custom-specs'
}

{ #category : #accessing }
PyramidBackgroundPropertyInputPaint >> paint: aBlPaint [

	self preview: aBlPaint pyramidBackgroundPreview
]

{ #category : #accessing }
PyramidBackgroundPropertyInputPaint >> preview [

	^ preview
]

{ #category : #accessing }
PyramidBackgroundPropertyInputPaint >> preview: anObject [

	preview := anObject
]
