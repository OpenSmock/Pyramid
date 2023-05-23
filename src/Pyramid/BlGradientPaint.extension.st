Extension { #name : #BlGradientPaint }

{ #category : #'*Pyramid' }
BlGradientPaint >> pyramidModalDefaultPaint: aPyramidPaintInput [

	aPyramidPaintInput buttonGradient click.
	aPyramidPaintInput inputGradient stopsColor stopManager from: self stops.
]
