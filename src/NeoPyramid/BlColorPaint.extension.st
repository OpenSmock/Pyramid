Extension { #name : #BlColorPaint }

{ #category : #'*NeoPyramid' }
BlColorPaint >> asForm [

	^ (Morph new
		  extent: 16 @ 16;
		  color: self color;
		  yourself) asForm
]

{ #category : #'*NeoPyramid' }
BlColorPaint >> selectOnBackgroundInput: aPyramidBackgroundInputPresenter [

	aPyramidBackgroundInputPresenter selectSolidPaintWith: self
]
