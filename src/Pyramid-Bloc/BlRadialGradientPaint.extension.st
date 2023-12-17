Extension { #name : #BlRadialGradientPaint }

{ #category : #'*Pyramid-Bloc' }
BlRadialGradientPaint >> = aBlPaint [

	super = aBlPaint ifFalse: [ ^ false ].
	^ self innerCenter = aBlPaint innerCenter and: [ self innerRadius = aBlPaint innerRadius and: [ self outerCenter = aBlPaint outerCenter and: [ self outerRadius = aBlPaint outerRadius ] ] ]
]

{ #category : #'*Pyramid-Bloc' }
BlRadialGradientPaint >> selectOnGradientPaintInput: aPyramidGradientPaintInputPresenter [

	super selectOnGradientPaintInput: aPyramidGradientPaintInputPresenter.
	aPyramidGradientPaintInputPresenter radialButton click.
	aPyramidGradientPaintInputPresenter centerInput value: self outerCenter.
	aPyramidGradientPaintInputPresenter radiusInput value: self outerRadius
]
