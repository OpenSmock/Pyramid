Extension { #name : #BlRadialGradientPaint }

{ #category : #'*NeoPyramid' }
BlRadialGradientPaint >> = aBlPaint [

	super = aBlPaint ifFalse: [ ^ false ].
	^ self center = aBlPaint center and: [ self radius = aBlPaint radius ]
]

{ #category : #'*NeoPyramid' }
BlRadialGradientPaint >> selectOnGradientPaintInput: aPyramidGradientPaintInputPresenter [

	super selectOnGradientPaintInput: aPyramidGradientPaintInputPresenter.
	aPyramidGradientPaintInputPresenter radialButton click.
	aPyramidGradientPaintInputPresenter centerInput value: self center.
	aPyramidGradientPaintInputPresenter radiusInput value: self radius
]
