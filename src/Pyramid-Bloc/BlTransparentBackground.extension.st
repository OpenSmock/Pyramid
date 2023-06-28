Extension { #name : #BlTransparentBackground }

{ #category : #'*Pyramid-Bloc' }
BlTransparentBackground >> pyramidBackgroundStrategy [

	^ PyramidBackgroundPropertyInputTransparent new
]

{ #category : #'*Pyramid-Bloc' }
BlTransparentBackground >> pyramidSelectMenuOnModal: aModal [

	aModal buttonTransparent click.
]
