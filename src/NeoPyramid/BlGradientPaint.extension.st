Extension { #name : #BlGradientPaint }

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
