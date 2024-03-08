Extension { #name : #BlHorizontalCoordinateEndAlignment }

{ #category : #'*Pyramid-Bloc' }
BlHorizontalCoordinateEndAlignment >> pyramidSelectOn: aFrameConstraintsPresenter [

	aFrameConstraintsPresenter selectCenter.
	aFrameConstraintsPresenter inputHasRelative state: true.
	aFrameConstraintsPresenter inputRelative value: self coordinate negated
]
