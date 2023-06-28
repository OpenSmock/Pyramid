Extension { #name : #BlImageBackground }

{ #category : #'*Pyramid-Bloc' }
BlImageBackground >> pyramidBackgroundStrategy [

	(self image respondsTo: #pyramidExternalRessourceSource) ifTrue: [
		^ PyramidBackgroundPropertyInputImage new
			  ressource: self image pyramidExternalRessourceSource;
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
