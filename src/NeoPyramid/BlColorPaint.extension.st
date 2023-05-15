Extension { #name : #BlColorPaint }

{ #category : #'*NeoPyramid' }
BlColorPaint >> pyramidBackgroundPreview [

	^ PyramidBackgroundPreviewSolidColor new color: self color
]

{ #category : #'*NeoPyramid' }
BlColorPaint >> pyramidModalDefaultPaint: aPyramidPaintInput [

	aPyramidPaintInput buttonColor click.
	aPyramidPaintInput inputSolid color: self color
]
