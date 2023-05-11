Extension { #name : #BlColorPaint }

{ #category : #'*NeoPyramid' }
BlColorPaint >> pyramidBackgroundPreview [

	^ PyramidBackgroundPreviewSolidColor new color: self color
]
