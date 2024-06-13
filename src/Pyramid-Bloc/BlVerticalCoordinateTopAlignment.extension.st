Extension { #name : 'BlVerticalCoordinateTopAlignment' }

{ #category : '*Pyramid-Bloc' }
BlVerticalCoordinateTopAlignment >> pyramidSelectOn: aFrameConstraintsPresenter [

	aFrameConstraintsPresenter selectStart.
	aFrameConstraintsPresenter inputHasRelative state: true.
	aFrameConstraintsPresenter inputRelative value: self coordinate
]
