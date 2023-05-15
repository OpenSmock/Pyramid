Extension { #name : #BlImageBackground }

{ #category : #'*NeoPyramid' }
BlImageBackground >> pyramidBackgroundStrategy [

	^ PyramidBackgroundPropertyInputUnknownStrategy new
]

{ #category : #'*NeoPyramid' }
BlImageBackground >> pyramidSelectMenuOnModal: aModal [

	aModal buttonImage click.
]
