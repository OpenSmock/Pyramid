Class {
	#name : #PyramidAbstractLayoutOrientationPresenter,
	#superclass : #PyramidSwitchInputPresenter,
	#instVars : [
		'buttonSwitch'
	],
	#category : #'Pyramid-Bloc-plugin-bloc-layout'
}

{ #category : #'as yet unclassified' }
PyramidAbstractLayoutOrientationPresenter >> switchState [

	self value: self value switchOrientation.
	self whenValueChangedDo value: self value
]

{ #category : #'as yet unclassified' }
PyramidAbstractLayoutOrientationPresenter >> value [

	^ self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
PyramidAbstractLayoutOrientationPresenter >> value: anOrientation [

	super value: anOrientation asBooleanForPyramid
]
