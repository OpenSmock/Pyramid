Class {
	#name : 'PyramidStopsInputPresenterTest',
	#superclass : 'TestCase',
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : 'Pyramid-Tests-cases-specs-custom',
	#package : 'Pyramid-Tests',
	#tag : 'cases-specs-custom'
}

{ #category : 'accessing' }
PyramidStopsInputPresenterTest >> dummyValues [

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

{ #category : 'accessing' }
PyramidStopsInputPresenterTest >> expectedEmptyValue [

	^ {  }
]

{ #category : 'accessing' }
PyramidStopsInputPresenterTest >> expectedMixedValues [

	^ {  }
]

{ #category : 'tests' }
PyramidStopsInputPresenterTest >> makeNewInput [

	^ PyramidBackgroundStopsInputPresenter new
]

{ #category : 'as yet unclassified' }
PyramidStopsInputPresenterTest >> triggerValueChangedOf: anInput [

	anInput bypassTrigger
]
