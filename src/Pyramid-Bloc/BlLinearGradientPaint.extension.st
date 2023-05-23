Extension { #name : #BlLinearGradientPaint }

{ #category : #'*Pyramid-Bloc' }
BlLinearGradientPaint >> pyramidBackgroundPreview [

	^ PyramidBackgroundPreviewGradientColor new
		  stops: self stops;
		  yourself
]

{ #category : #'*Pyramid-Bloc' }
BlLinearGradientPaint >> pyramidModalDefaultPaint: aPyramidPaintInput [

	super pyramidModalDefaultPaint: aPyramidPaintInput.
	aPyramidPaintInput inputGradient modeSelector buttonLinear click.
	aPyramidPaintInput inputGradient modeSelector linearDirection point: self end - self start
]
