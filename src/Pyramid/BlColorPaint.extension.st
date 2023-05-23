Extension { #name : #BlColorPaint }

{ #category : #'*Pyramid' }
BlColorPaint >> pyramidBackgroundPreview [

	^ PyramidBackgroundPreviewSolidColor new color: self color
]

{ #category : #'*Pyramid' }
BlColorPaint >> pyramidModalDefaultPaint: aPyramidPaintInput [

	aPyramidPaintInput buttonColor click.
	aPyramidPaintInput inputSolid color: self color
]
