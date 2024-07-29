Extension { #name : #BlVerticalCenterAlignment }

{ #category : #'*Pyramid-Bloc' }
BlVerticalCenterAlignment >> pyramidSelectOn: aFrameConstraintsPresenter [

	aFrameConstraintsPresenter selectCenter.
	aFrameConstraintsPresenter inputHasRelative state: false.
	aFrameConstraintsPresenter inputRelative value: 0
]
