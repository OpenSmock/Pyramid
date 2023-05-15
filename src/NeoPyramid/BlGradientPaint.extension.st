Extension { #name : #BlGradientPaint }

{ #category : #'*NeoPyramid' }
BlGradientPaint >> pyramidModalDefaultPaint: aPyramidPaintInput [

	aPyramidPaintInput buttonGradient click.
	aPyramidPaintInput inputGradient stopsColor stopManager from: self stops.
]
