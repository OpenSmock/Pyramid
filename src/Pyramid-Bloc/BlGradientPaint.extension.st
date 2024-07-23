Extension { #name : #BlGradientPaint }

{ #category : #'*Pyramid-Bloc' }
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

{ #category : #'*Pyramid-Bloc' }
BlGradientPaint >> selectOnBackgroundInput: aPyramidBackgroundInputPresenter [

	aPyramidBackgroundInputPresenter selectPaintGradientWith: self
]

{ #category : #'*Pyramid-Bloc' }
BlGradientPaint >> selectOnGradientPaintInput: aPyramidGradientPaintInputPresenter [

	aPyramidGradientPaintInputPresenter stopsInput value:self stops.
]
