Extension { #name : #BlLayoutExactResizer }

{ #category : #'*Pyramid-Bloc' }
BlLayoutExactResizer >> pyramidSelectConstraintsResizerOn: aPyramidConstraintsPresenter [

	| item |
	item := (aPyramidConstraintsPresenter selectorInputs select: [ :each |
		         each value targetClass = self class ]) first.
	item key click.
	aPyramidConstraintsPresenter submit: item value.
	item value associatedPresenter number: self size.
]
