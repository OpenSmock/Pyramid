Extension { #name : 'BlHorizontalCoordinateLeftAlignment' }

{ #category : '*Pyramid-Bloc' }
BlHorizontalCoordinateLeftAlignment >> pyramidSelectOn: aFrameConstraintsPresenter [

	aFrameConstraintsPresenter selectStart.
	aFrameConstraintsPresenter inputHasRelative
		state: true.
	aFrameConstraintsPresenter inputRelative
		value: self coordinate
]
