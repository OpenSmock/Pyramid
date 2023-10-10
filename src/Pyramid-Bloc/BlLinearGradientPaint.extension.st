Extension { #name : 'BlLinearGradientPaint' }

{ #category : '*Pyramid-Bloc' }
BlLinearGradientPaint >> = aBlPaint [

	super = aBlPaint ifFalse: [ ^ false ].
	^ self end = aBlPaint end and: [ self start = aBlPaint start ]
]

{ #category : '*Pyramid-Bloc' }
BlLinearGradientPaint >> selectOnGradientPaintInput: aPyramidGradientPaintInputPresenter [

	super selectOnGradientPaintInput: aPyramidGradientPaintInputPresenter.
	aPyramidGradientPaintInputPresenter linearButton click.
	aPyramidGradientPaintInputPresenter startInput value: self start.
	aPyramidGradientPaintInputPresenter endInput value: self end.
	
]
