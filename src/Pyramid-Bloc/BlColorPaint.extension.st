Extension { #name : #BlColorPaint }

{ #category : #'*Pyramid-Bloc' }
BlColorPaint >> asForm [

	^ (Morph new
		  extent: 16 @ 16;
		  color: self color;
		  yourself) asForm
]

{ #category : #'*Pyramid-Bloc' }
BlColorPaint >> selectOnBackgroundInput: aPyramidBackgroundInputPresenter [

	aPyramidBackgroundInputPresenter selectPaintSolidWith: self
]
