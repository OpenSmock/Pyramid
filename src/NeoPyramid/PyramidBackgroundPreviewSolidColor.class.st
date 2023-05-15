Class {
	#name : #PyramidBackgroundPreviewSolidColor,
	#superclass : #PyramidBackgroundPreviewAbstract,
	#instVars : [
		'morphColor'
	],
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #accessing }
PyramidBackgroundPreviewSolidColor >> color: aColor [

	self morphColor color: aColor
]

{ #category : #initialization }
PyramidBackgroundPreviewSolidColor >> initializePresenters [

	super initializePresenters.
	morphColor := Morph new
		              extent: self width @ self height;
		              color: Color transparent;
		              yourself.

	morphBack addMorph: morphColor behind: morphTag.
]

{ #category : #accessing }
PyramidBackgroundPreviewSolidColor >> morphColor [

	^ morphColor
]
