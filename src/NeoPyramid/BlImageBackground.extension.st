Extension { #name : #BlImageBackground }

{ #category : #'*NeoPyramid' }
BlImageBackground >> pyramidBackgroundStrategy [

	(self image respondsTo: #pyramidExternalRessource) ifTrue: [ ^ PyramidBackgroundPropertyInputImage new
		  ressource: self image pyramidExternalRessource;
		  yourself ].
	^ PyramidBackgroundPropertyInputImage new
		  ressource: nil;
		  yourself
	
]

{ #category : #'*NeoPyramid' }
BlImageBackground >> pyramidSelectMenuOnModal: aModal [

	aModal buttonImage click.
	aModal currentPresenter setImage: self image
]
