Extension { #name : #BlGradientPaint }

{ #category : #'*Pyramid-Bloc' }
BlGradientPaint >> pyramidModalDefaultPaint: aPyramidPaintInput [

	aPyramidPaintInput buttonGradient click.
	aPyramidPaintInput inputGradient stopsColor stopManager from: self stops.
]
