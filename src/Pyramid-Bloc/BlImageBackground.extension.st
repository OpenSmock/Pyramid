Extension { #name : #BlImageBackground }

{ #category : #'*Pyramid-Bloc' }
BlImageBackground >> pyramidBackgroundStrategy [

	(self image respondsTo: #pyramidExternalRessource) ifTrue: [ ^ PyramidBackgroundPropertyInputImage new
		  ressource: self image pyramidExternalRessource;
		  yourself ].
	^ PyramidBackgroundPropertyInputImage new
		  ressource: nil;
		  yourself
	
]

{ #category : #'*Pyramid-Bloc' }
BlImageBackground >> pyramidSelectMenuOnModal: aModal [

	aModal buttonImage click.
	aModal currentPresenter setImage: self image
]
