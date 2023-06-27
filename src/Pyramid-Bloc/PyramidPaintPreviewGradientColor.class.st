Class {
	#name : #PyramidPaintPreviewGradientColor,
	#superclass : #PyramidPaintPreviewAbstract,
	#instVars : [
		'morphColorStart',
		'morphColorEnd'
	],
	#category : #'Pyramid-Bloc-custom-specs-paint'
}

{ #category : #initialization }
PyramidPaintPreviewGradientColor >> initializePresenters [

	super initializePresenters.
	morphColorStart := Morph new
		              extent: self width @( self height / 2);
		              color: Color transparent;
		              yourself.
	morphColorEnd := Morph new
		              extent: self width @( self height / 2);
							position: 0 @ ( self height / 2 );
		              color: Color transparent;
		              yourself.

	morphBack addMorph: morphColorStart behind: morphTag.
	morphBack addMorph: morphColorEnd behind: morphTag
]

{ #category : #accessing }
PyramidPaintPreviewGradientColor >> morphColorEnd [

	^ morphColorEnd
]

{ #category : #accessing }
PyramidPaintPreviewGradientColor >> morphColorStart [

	^ morphColorStart
]

{ #category : #accessing }
PyramidPaintPreviewGradientColor >> stops: aCollection [

	self morphColorStart color: aCollection first value.
	self morphColorEnd color: aCollection last value
]
