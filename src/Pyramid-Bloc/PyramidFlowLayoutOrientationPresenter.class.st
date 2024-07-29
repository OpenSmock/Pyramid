Class {
	#name : #PyramidFlowLayoutOrientationPresenter,
	#superclass : #PyramidAbstractLayoutOrientationPresenter,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidFlowLayoutOrientationPresenter >> value [

	^ self state asOrientationForFlowPyramid
]
