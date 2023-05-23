Class {
	#name : #PyramidBackgroundPropertyInputPaint,
	#superclass : #PyramidBackgroundPropertyInputStrategy,
	#instVars : [
		'preview'
	],
	#category : #'Pyramid-plugin-properties-custom'
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
