Extension { #name : #BlLayoutExactResizer }

{ #category : #'*Pyramid-Bloc' }
BlLayoutExactResizer >> asPyramidConstraintsArgument [

	^ {
		  #exact:.
		  self size }
]

{ #category : #'*Pyramid-Bloc' }
BlLayoutExactResizer >> setResizerConstraintsOn: aPyramidBasicConstraintsInputPresenter [

	aPyramidBasicConstraintsInputPresenter setExact
]
