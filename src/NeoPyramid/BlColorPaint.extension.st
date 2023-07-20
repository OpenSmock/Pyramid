Extension { #name : #BlColorPaint }

{ #category : #'*NeoPyramid' }
BlColorPaint >> asForm [

	^ (Morph new
		  extent: 16 @ 16;
		  color: self color;
		  yourself) asForm
]
