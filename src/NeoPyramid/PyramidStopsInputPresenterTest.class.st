Class {
	#name : #PyramidStopsInputPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : #'NeoPyramid-cases-specs-custom'
}

{ #category : #accessing }
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

{ #category : #tests }
PyramidStopsInputPresenterTest >> makeNewInput [

	^ NeoPyramidStopsInputPresenter new
]
