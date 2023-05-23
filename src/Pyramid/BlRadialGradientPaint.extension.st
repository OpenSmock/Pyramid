Extension { #name : #BlRadialGradientPaint }

{ #category : #'*Pyramid' }
BlRadialGradientPaint >> pyramidBackgroundPreview [

	^ PyramidBackgroundPreviewGradientColor new
		  stops: self stops;
		  yourself
]

{ #category : #'*Pyramid' }
BlRadialGradientPaint >> pyramidModalDefaultPaint: aPyramidPaintInput [

	super pyramidModalDefaultPaint: aPyramidPaintInput.
	aPyramidPaintInput inputGradient modeSelector buttonRadial click.
	aPyramidPaintInput inputGradient modeSelector linearDirection point:
		self center.
		aPyramidPaintInput inputGradient modeSelector radialPosition point:
		self center.
		aPyramidPaintInput inputGradient modeSelector radialRadius number:
		self radius
]
