Extension { #name : 'BlHorizontalEndAlignment' }

{ #category : '*Pyramid-Bloc' }
BlHorizontalEndAlignment >> pyramidSelectOn: aFrameConstraintsPresenter [

	aFrameConstraintsPresenter selectEnd.
	aFrameConstraintsPresenter inputHasRelative state: false.
	aFrameConstraintsPresenter inputRelative value: 0
]
