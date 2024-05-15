Extension { #name : 'BlBottomAlignment' }

{ #category : '*Pyramid-Bloc' }
BlBottomAlignment >> pyramidSelectOn: aFrameConstraintsPresenter [

	aFrameConstraintsPresenter selectEnd.
	aFrameConstraintsPresenter inputHasRelative state: false.
	aFrameConstraintsPresenter inputRelative value: 0
]
