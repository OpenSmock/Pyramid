Extension { #name : 'True' }

{ #category : '*Pyramid-Bloc' }
True >> asOrientationForFlowPyramid [

	^ BlLayoutOrientation vertical
]

{ #category : '*Pyramid-Bloc' }
True >> asOrientationForLinearPyramid [
	^ BlLinearLayoutVerticalOrientation new
]
