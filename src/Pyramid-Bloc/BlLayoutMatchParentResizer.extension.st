Extension { #name : #BlLayoutMatchParentResizer }

{ #category : #'*Pyramid-Bloc' }
BlLayoutMatchParentResizer >> asPyramidConstraintsArgument [

	^ #matchParent
]

{ #category : #'*Pyramid-Bloc' }
BlLayoutMatchParentResizer >> setResizerConstraintsOn: aPyramidBasicConstraintsInputPresenter [

	aPyramidBasicConstraintsInputPresenter setMatchParent
]
