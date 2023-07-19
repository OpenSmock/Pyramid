Class {
	#name : #PyramidSwitchInputPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : #'NeoPyramid-cases-specs-custom'
}

{ #category : #accessing }
PyramidSwitchInputPresenterTest >> dummyValues [

	^ { true . false . false . true . true }
]

{ #category : #accessing }
PyramidSwitchInputPresenterTest >> expectedEmptyValue [

	^ PyramidUnknowState new
]

{ #category : #accessing }
PyramidSwitchInputPresenterTest >> expectedMixedValues [

	^ PyramidUnknowState new
]

{ #category : #tests }
PyramidSwitchInputPresenterTest >> makeNewInput [

	^ PyramidSwitchInputPresenter new
]

{ #category : #'as yet unclassified' }
PyramidSwitchInputPresenterTest >> triggerValueChangedOf: anInput [

	anInput button click
]
