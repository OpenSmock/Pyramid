Extension { #name : #BlPaintBackground }

{ #category : #'*NeoPyramid' }
BlPaintBackground >> pyramidBackgroundStrategy [

	^ PyramidBackgroundPropertyInputPaint new paint: self paint; yourself
]

{ #category : #'*NeoPyramid' }
BlPaintBackground >> pyramidSelectMenuOnModal: aModal [

	aModal buttonPaint click.
	aModal currentPresenter setDefaultPaint: self paint
]
