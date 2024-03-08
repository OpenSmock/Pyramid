Extension { #name : #BlLinearGradientPaint }

{ #category : #'*Pyramid-Bloc' }
BlLinearGradientPaint >> selectOnGradientPaintInput: aPyramidGradientPaintInputPresenter [

	super selectOnGradientPaintInput: aPyramidGradientPaintInputPresenter.
	aPyramidGradientPaintInputPresenter linearButton click.
	aPyramidGradientPaintInputPresenter startInput value: self start.
	aPyramidGradientPaintInputPresenter endInput value: self end.
	
]
