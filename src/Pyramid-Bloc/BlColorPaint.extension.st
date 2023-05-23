Extension { #name : #BlColorPaint }

{ #category : #'*Pyramid-Bloc' }
BlColorPaint >> pyramidBackgroundPreview [

	^ PyramidBackgroundPreviewSolidColor new color: self color
]

{ #category : #'*Pyramid-Bloc' }
BlColorPaint >> pyramidModalDefaultPaint: aPyramidPaintInput [

	aPyramidPaintInput buttonColor click.
	aPyramidPaintInput inputSolid color: self color
]
