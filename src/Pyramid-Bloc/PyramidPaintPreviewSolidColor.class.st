Class {
	#name : #PyramidPaintPreviewSolidColor,
	#superclass : #PyramidPaintPreviewAbstract,
	#instVars : [
		'morphColor'
	],
	#category : #'Pyramid-Bloc-custom-specs-paint'
}

{ #category : #accessing }
PyramidPaintPreviewSolidColor >> color: aColor [

	self morphColor color: aColor
]

{ #category : #initialization }
PyramidPaintPreviewSolidColor >> initializePresenters [

	super initializePresenters.
	morphColor := Morph new
		              extent: self width @ self height;
		              color: Color transparent;
		              yourself.

	morphBack addMorph: morphColor behind: morphTag.
]

{ #category : #accessing }
PyramidPaintPreviewSolidColor >> morphColor [

	^ morphColor
]
