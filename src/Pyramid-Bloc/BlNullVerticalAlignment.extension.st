Extension { #name : 'BlNullVerticalAlignment' }

{ #category : '*Pyramid-Bloc' }
BlNullVerticalAlignment >> pyramidSelectOn: aFrameConstraintsPresenter [

	aFrameConstraintsPresenter selectNull.
	aFrameConstraintsPresenter inputHasRelative state: false.
	aFrameConstraintsPresenter inputRelative value: 0
]
