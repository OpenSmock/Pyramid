Extension { #name : 'BlHorizontalCenterAlignment' }

{ #category : '*Pyramid-Bloc' }
BlHorizontalCenterAlignment >> pyramidSelectOn: aFrameConstraintsPresenter [

	aFrameConstraintsPresenter selectCenter.
	aFrameConstraintsPresenter inputHasRelative state: false.
	aFrameConstraintsPresenter inputRelative value: 0
]
