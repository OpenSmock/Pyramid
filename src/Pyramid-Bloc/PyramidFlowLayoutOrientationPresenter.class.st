Class {
	#name : 'PyramidFlowLayoutOrientationPresenter',
	#superclass : 'PyramidSwitchInputPresenter',
	#instVars : [
		'buttonSwitch'
	],
	#category : 'Pyramid-Bloc-plugin-bloc-layout',
	#package : 'Pyramid-Bloc',
	#tag : 'plugin-bloc-layout'
}

{ #category : 'as yet unclassified' }
PyramidFlowLayoutOrientationPresenter >> switchState [

	self value: self value switchOrientation.
	self whenValueChangedDo value: self value
]

{ #category : 'as yet unclassified' }
PyramidFlowLayoutOrientationPresenter >> value [

	^ self state asOrientationForPyramid
]

{ #category : 'as yet unclassified' }
PyramidFlowLayoutOrientationPresenter >> value: anOrientation [

	super value: anOrientation asBooleanForPyramid
]
