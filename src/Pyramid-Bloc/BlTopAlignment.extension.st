Extension { #name : 'BlTopAlignment' }

{ #category : '*Pyramid-Bloc' }
BlTopAlignment >> pyramidSelectOn: aFrameConstraintsPresenter [

	aFrameConstraintsPresenter selectStart.
	aFrameConstraintsPresenter inputHasRelative state: false.
	aFrameConstraintsPresenter inputRelative value: 0
]
