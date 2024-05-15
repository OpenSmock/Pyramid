Extension { #name : 'BlLayoutCommonConstraintsAxis' }

{ #category : '*Pyramid-Bloc' }
BlLayoutCommonConstraintsAxis >> asPyramidConstraintsArgument [

	^ self resizer asPyramidConstraintsArgument
]

{ #category : '*Pyramid-Bloc' }
BlLayoutCommonConstraintsAxis >> setConstraintsOn: aPyramidBasicConstraintsInputPresenter [

	self resizer setResizerConstraintsOn: aPyramidBasicConstraintsInputPresenter
]
