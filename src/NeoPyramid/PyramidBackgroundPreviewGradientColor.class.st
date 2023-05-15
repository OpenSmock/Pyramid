Class {
	#name : #PyramidBackgroundPreviewGradientColor,
	#superclass : #PyramidBackgroundPreviewAbstract,
	#instVars : [
		'morphColorStart',
		'morphColorEnd'
	],
	#category : #'NeoPyramid-plugin-properties-custom'
}

{ #category : #initialization }
PyramidBackgroundPreviewGradientColor >> initializePresenters [

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
PyramidBackgroundPreviewGradientColor >> morphColorEnd [

	^ morphColorEnd
]

{ #category : #accessing }
PyramidBackgroundPreviewGradientColor >> morphColorStart [

	^ morphColorStart
]

{ #category : #accessing }
PyramidBackgroundPreviewGradientColor >> stops: aCollection [

	self morphColorStart color: aCollection first value.
	self morphColorEnd color: aCollection last value
]
