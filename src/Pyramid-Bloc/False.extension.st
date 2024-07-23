Extension { #name : #False }

{ #category : #'*Pyramid-Bloc' }
False >> asOrientationForFlowPyramid [

	^ BlLayoutOrientation horizontal
]

{ #category : #'*Pyramid-Bloc' }
False >> asOrientationForLinearPyramid [

	^ BlLinearLayoutHorizontalOrientation new
]
