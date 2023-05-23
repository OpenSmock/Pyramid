Extension { #name : #BlCompositeBackground }

{ #category : #'*Pyramid-Bloc' }
BlCompositeBackground >> pyramidBackgroundStrategy [

	^ PyramidBackgroundPropertyInputUnknownStrategy new
]

{ #category : #'*Pyramid-Bloc' }
BlCompositeBackground >> pyramidSelectMenuOnModal: aModal [

	aModal buttonComposite click
]
