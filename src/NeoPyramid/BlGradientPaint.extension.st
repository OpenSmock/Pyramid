Extension { #name : #BlGradientPaint }

{ #category : #'*NeoPyramid' }
BlGradientPaint >> = aBlPaint [

	super = aBlPaint ifFalse: [ ^ false ].
	^ self stops = aBlPaint stops
]

{ #category : #'*NeoPyramid' }
BlGradientPaint >> asForm [

	^ (Morph new
		  extent: 16 @ 16;
		  color: self stops last value;
		  addMorph: (Morph new
				   extent: 8 @ 16;
				   color: self stops first value;
				   yourself);
		  yourself) asForm
]

{ #category : #'*NeoPyramid' }
BlGradientPaint >> selectOnBackgroundInput: aPyramidBackgroundInputPresenter [

	aPyramidBackgroundInputPresenter selectPaintGradientWith: self
]

{ #category : #'*NeoPyramid' }
BlGradientPaint >> selectOnGradientPaintInput: aPyramidGradientPaintInputPresenter [

	aPyramidGradientPaintInputPresenter stopsInput value:self stops.
]
