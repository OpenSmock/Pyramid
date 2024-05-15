Extension { #name : 'BlLinearLayoutHorizontalOrientation' }

{ #category : '*Pyramid-Bloc' }
BlLinearLayoutHorizontalOrientation >> asBooleanForPyramid [

	^ false
]

{ #category : '*Pyramid-Bloc' }
BlLinearLayoutHorizontalOrientation >> switchOrientation [

	^ BlLinearLayoutVerticalOrientation new
]
