Extension { #name : #BlTransparentBackground }

{ #category : #'*Pyramid' }
BlTransparentBackground >> pyramidBackgroundStrategy [

	^ PyramidBackgroundPropertyInputTransparent new
]

{ #category : #'*Pyramid' }
BlTransparentBackground >> pyramidSelectMenuOnModal: aModal [

	aModal buttonTransparent click.
]
