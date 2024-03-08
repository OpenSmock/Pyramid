Extension { #name : #BlRadialGradientPaint }

{ #category : #'*Pyramid-Bloc' }
BlRadialGradientPaint >> selectOnGradientPaintInput: aPyramidGradientPaintInputPresenter [

	super selectOnGradientPaintInput: aPyramidGradientPaintInputPresenter.
	aPyramidGradientPaintInputPresenter radialButton click.
	aPyramidGradientPaintInputPresenter centerInput value: self outerCenter.
	aPyramidGradientPaintInputPresenter radiusInput value: self outerRadius
]
