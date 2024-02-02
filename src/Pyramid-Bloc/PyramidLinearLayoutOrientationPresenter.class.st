Class {
	#name : #PyramidLinearLayoutOrientationPresenter,
	#superclass : #PyramidAbstractLayoutOrientationPresenter,
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidLinearLayoutOrientationPresenter >> value [

	^ self state asOrientationForLinearPyramid 
]
