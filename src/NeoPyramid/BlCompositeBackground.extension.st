Extension { #name : #BlCompositeBackground }

{ #category : #'*NeoPyramid' }
BlCompositeBackground >> pyramidBackgroundStrategy [

	^ PyramidBackgroundPropertyInputUnknownStrategy new
]

{ #category : #'*NeoPyramid' }
BlCompositeBackground >> pyramidSelectMenuOnModal: aModal [

	aModal buttonComposite click
]
