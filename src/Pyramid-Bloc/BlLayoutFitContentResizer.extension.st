Extension { #name : 'BlLayoutFitContentResizer' }

{ #category : '*Pyramid-Bloc' }
BlLayoutFitContentResizer >> asPyramidConstraintsArgument [

	^ #fitContent
]

{ #category : '*Pyramid-Bloc' }
BlLayoutFitContentResizer >> setResizerConstraintsOn: aPyramidBasicConstraintsInputPresenter [

	aPyramidBasicConstraintsInputPresenter setFitContent
]
