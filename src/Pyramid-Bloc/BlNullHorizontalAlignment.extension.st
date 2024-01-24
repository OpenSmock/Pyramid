Extension { #name : #BlNullHorizontalAlignment }

{ #category : #'*Pyramid-Bloc' }
BlNullHorizontalAlignment >> pyramidSelectOn: aFrameConstraintsPresenter [

	aFrameConstraintsPresenter selectNull.
	aFrameConstraintsPresenter inputHasRelative state: false.
	aFrameConstraintsPresenter inputRelative value: 0
]
