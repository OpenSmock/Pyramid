Extension { #name : 'BlRadialGradientPaint' }

{ #category : '*Pyramid-Bloc' }
BlRadialGradientPaint >> = aBlPaint [

	super = aBlPaint ifFalse: [ ^ false ].
	^ self center = aBlPaint center and: [ self radius = aBlPaint radius ]
]

{ #category : '*Pyramid-Bloc' }
BlRadialGradientPaint >> selectOnGradientPaintInput: aPyramidGradientPaintInputPresenter [

	super selectOnGradientPaintInput: aPyramidGradientPaintInputPresenter.
	aPyramidGradientPaintInputPresenter radialButton click.
	aPyramidGradientPaintInputPresenter centerInput value: self center.
	aPyramidGradientPaintInputPresenter radiusInput value: self radius
]
