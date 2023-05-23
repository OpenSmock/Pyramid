Extension { #name : #BlImageBackground }

{ #category : #'*Pyramid' }
BlImageBackground >> pyramidBackgroundStrategy [

	(self image respondsTo: #pyramidExternalRessource) ifTrue: [ ^ PyramidBackgroundPropertyInputImage new
		  ressource: self image pyramidExternalRessource;
		  yourself ].
	^ PyramidBackgroundPropertyInputImage new
		  ressource: nil;
		  yourself
	
]

{ #category : #'*Pyramid' }
BlImageBackground >> pyramidSelectMenuOnModal: aModal [

	aModal buttonImage click.
	aModal currentPresenter setImage: self image
]
