Extension { #name : #BlPaintBackground }

{ #category : #'*NeoPyramid' }
BlPaintBackground >> pyramidBackgroundStrategy [

	^ PyramidBackgroundPropertyInputPaint new paint: self paint; yourself
]
