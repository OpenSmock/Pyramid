Extension { #name : #BlLayoutResizer }

{ #category : #'*Pyramid-Bloc' }
BlLayoutResizer >> pyramidSelectConstraintsResizerOn: aPyramidConstraintsPresenter [

	| item |
	item := (aPyramidConstraintsPresenter selectorInputs select: [ :each |
		         each value targetClass = self class ]) first.
	item key click.
	aPyramidConstraintsPresenter submit: item value
]
