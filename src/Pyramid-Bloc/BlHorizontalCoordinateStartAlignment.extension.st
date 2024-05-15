Extension { #name : 'BlHorizontalCoordinateStartAlignment' }

{ #category : '*Pyramid-Bloc' }
BlHorizontalCoordinateStartAlignment >> pyramidSelectOn: aFrameConstraintsPresenter [

	aFrameConstraintsPresenter selectCenter.
	aFrameConstraintsPresenter inputHasRelative state: true.
	aFrameConstraintsPresenter inputRelative value: self coordinate
]
