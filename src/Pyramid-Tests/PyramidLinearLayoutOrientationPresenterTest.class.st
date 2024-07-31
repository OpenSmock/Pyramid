Class {
	#name : #PyramidLinearLayoutOrientationPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : #'Pyramid-Tests-cases-specs-custom'
}

{ #category : #accessing }
PyramidLinearLayoutOrientationPresenterTest >> dummyValues [

	^ {
		  BlLinearLayoutHorizontalOrientation new.
		  BlLinearLayoutVerticalOrientation new.
		  BlLinearLayoutHorizontalOrientation new.
		  BlLinearLayoutVerticalOrientation new.
		  BlLinearLayoutHorizontalOrientation new }
]

{ #category : #accessing }
PyramidLinearLayoutOrientationPresenterTest >> expectedEmptyValue [

	^ PyramidUnknowState new
]

{ #category : #accessing }
PyramidLinearLayoutOrientationPresenterTest >> expectedMixedValues [

	^ PyramidUnknowState new
]

{ #category : #tests }
PyramidLinearLayoutOrientationPresenterTest >> makeNewInput [

	^ PyramidLinearLayoutOrientationPresenter new
]

{ #category : #'as yet unclassified' }
PyramidLinearLayoutOrientationPresenterTest >> triggerValueChangedOf: anInput [

	anInput button click
]
