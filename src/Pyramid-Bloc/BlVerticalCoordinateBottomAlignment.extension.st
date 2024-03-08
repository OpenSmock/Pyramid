Extension { #name : #BlVerticalCoordinateBottomAlignment }

{ #category : #'*Pyramid-Bloc' }
BlVerticalCoordinateBottomAlignment >> pyramidSelectOn: aFrameConstraintsPresenter [

	aFrameConstraintsPresenter selectEnd.
	aFrameConstraintsPresenter inputHasRelative state: true.
	aFrameConstraintsPresenter inputRelative value: self coordinate
]
