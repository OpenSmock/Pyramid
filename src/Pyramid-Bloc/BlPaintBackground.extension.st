Extension { #name : #BlPaintBackground }

{ #category : #'*Pyramid-Bloc' }
BlPaintBackground >> pyramidBackgroundStrategy [

	^ PyramidBackgroundPropertyInputPaint new paint: self paint; yourself
]

{ #category : #'*Pyramid-Bloc' }
BlPaintBackground >> pyramidSelectMenuOnModal: aModal [

	aModal buttonPaint click.
	aModal currentPresenter setDefaultPaint: self paint
]
