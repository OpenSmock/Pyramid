Class {
	#name : #PyramidFlowLayoutOrientationPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : 'Pyramid-Tests-cases-specs-custom'
}

{ #category : #accessing }
PyramidFlowLayoutOrientationPresenterTest >> dummyValues [

	^ { BlLayoutOrientation vertical. BlLayoutOrientation horizontal. BlLayoutOrientation horizontal. BlLayoutOrientation vertical. BlLayoutOrientation horizontal }
]

{ #category : #accessing }
PyramidFlowLayoutOrientationPresenterTest >> expectedEmptyValue [

	^ PyramidUnknowState new
]

{ #category : #accessing }
PyramidFlowLayoutOrientationPresenterTest >> expectedMixedValues [

	^ PyramidUnknowState new
]

{ #category : #tests }
PyramidFlowLayoutOrientationPresenterTest >> makeNewInput [

	^ PyramidFlowLayoutOrientationPresenter new
]

{ #category : #'as yet unclassified' }
PyramidFlowLayoutOrientationPresenterTest >> triggerValueChangedOf: anInput [

	anInput button click
]
