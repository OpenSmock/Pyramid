Class {
	#name : #PyramidLayoutInputPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : #'Pyramid-Tests-cases-specs-custom'
}

{ #category : #accessing }
PyramidLayoutInputPresenterTest >> dummyValues [

	^ {
		  BlBasicLayout new.
		  BlFlowLayout horizontal.
		  BlFlowLayout vertical.
		  BlLinearLayout horizontal.
		  BlLinearLayout vertical.
		BlFrameLayout new.
		  BlProportionalLayout new }
]

{ #category : #accessing }
PyramidLayoutInputPresenterTest >> expectedEmptyValue [

	^ PyramidUnknowState new
]

{ #category : #accessing }
PyramidLayoutInputPresenterTest >> expectedMixedValues [

	^ PyramidUnknowState new
]

{ #category : #tests }
PyramidLayoutInputPresenterTest >> makeNewInput [

	^ PyramidLayoutInputPresenter new
]

{ #category : #'as yet unclassified' }
PyramidLayoutInputPresenterTest >> triggerValueChangedOf: anInput [

	anInput valueButtons first click
]
