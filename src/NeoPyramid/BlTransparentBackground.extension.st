Extension { #name : #BlTransparentBackground }

{ #category : #'*NeoPyramid' }
BlTransparentBackground >> pyramidBackgroundStrategy [

	^ PyramidBackgroundPropertyInputTransparent new
]

{ #category : #'*NeoPyramid' }
BlTransparentBackground >> pyramidSelectMenuOnModal: aModal [

	aModal buttonTransparent click.
]
