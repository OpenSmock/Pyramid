Extension { #name : #BlCompositeBackground }

{ #category : #'*Pyramid' }
BlCompositeBackground >> pyramidBackgroundStrategy [

	^ PyramidBackgroundPropertyInputUnknownStrategy new
]

{ #category : #'*Pyramid' }
BlCompositeBackground >> pyramidSelectMenuOnModal: aModal [

	aModal buttonComposite click
]
