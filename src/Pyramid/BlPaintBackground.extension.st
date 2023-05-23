Extension { #name : #BlPaintBackground }

{ #category : #'*Pyramid' }
BlPaintBackground >> pyramidBackgroundStrategy [

	^ PyramidBackgroundPropertyInputPaint new paint: self paint; yourself
]

{ #category : #'*Pyramid' }
BlPaintBackground >> pyramidSelectMenuOnModal: aModal [

	aModal buttonPaint click.
	aModal currentPresenter setDefaultPaint: self paint
]
