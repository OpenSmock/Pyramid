Extension { #name : 'BlHorizontalStartAlignment' }

{ #category : '*Pyramid-Bloc' }
BlHorizontalStartAlignment >> pyramidSelectOn: aFrameConstraintsPresenter [

	aFrameConstraintsPresenter selectStart.
	aFrameConstraintsPresenter inputHasRelative state: false.
	aFrameConstraintsPresenter inputRelative value: 0
]
