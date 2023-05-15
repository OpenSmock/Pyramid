Extension { #name : #BlLinearGradientPaint }

{ #category : #'*NeoPyramid' }
BlLinearGradientPaint >> pyramidBackgroundPreview [

	^ PyramidBackgroundPreviewGradientColor new
		  stops: self stops;
		  yourself
]

{ #category : #'*NeoPyramid' }
BlLinearGradientPaint >> pyramidModalDefaultPaint: aPyramidPaintInput [

	super pyramidModalDefaultPaint: aPyramidPaintInput.
	aPyramidPaintInput inputGradient modeSelector buttonLinear click.
	aPyramidPaintInput inputGradient modeSelector linearDirection point: self end - self start
]
