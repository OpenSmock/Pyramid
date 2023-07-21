Extension { #name : #BlColorPaint }

{ #category : #'*NeoPyramid' }
BlColorPaint >> = aBlPaint [

	super = aBlPaint ifFalse: [ ^ false ].
	^ self color = aBlPaint color
]

{ #category : #'*NeoPyramid' }
BlColorPaint >> asForm [

	^ (Morph new
		  extent: 16 @ 16;
		  color: self color;
		  yourself) asForm
]

{ #category : #'*NeoPyramid' }
BlColorPaint >> selectOnBackgroundInput: aPyramidBackgroundInputPresenter [

	aPyramidBackgroundInputPresenter selectPaintSolidWith: self
]
