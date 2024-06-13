Extension { #name : 'BlHorizontalCoordinateRightAlignment' }

{ #category : '*Pyramid-Bloc' }
BlHorizontalCoordinateRightAlignment >> pyramidSelectOn: aFrameConstraintsPresenter [

	aFrameConstraintsPresenter selectEnd.
	aFrameConstraintsPresenter inputHasRelative state: true.
	aFrameConstraintsPresenter inputRelative value: self coordinate
]
