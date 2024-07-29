Class {
	#name : #PyramidBackgroundStopsInputPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : 'Pyramid-Tests-cases-specs-custom'
}

{ #category : #accessing }
PyramidBackgroundStopsInputPresenterTest >> dummyValues [

	^ { {
		  (0 -> Color blue).
		  (1 -> Color red) }. {
		  (0 -> Color blue).
		  (0.5 -> Color green).
		  (1 -> Color red) } . 
		{
		  (0 -> Color blue).
		  (0.5 -> Color green).
		(0.5 -> Color yellow).
		  (1 -> Color red) } }
]

{ #category : #accessing }
PyramidBackgroundStopsInputPresenterTest >> expectedEmptyValue [

	^ PyramidUnknowState new
]

{ #category : #accessing }
PyramidBackgroundStopsInputPresenterTest >> expectedMixedValues [

	^ PyramidUnknowState new
]

{ #category : #tests }
PyramidBackgroundStopsInputPresenterTest >> makeNewInput [

	^ PyramidBackgroundStopsInputPresenter new
]

{ #category : #'as yet unclassified' }
PyramidBackgroundStopsInputPresenterTest >> triggerValueChangedOf: anInput [

	anInput whenValueChangedDo value: anInput value
]
