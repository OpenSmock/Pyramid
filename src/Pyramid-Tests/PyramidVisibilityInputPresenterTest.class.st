Class {
	#name : #PyramidVisibilityInputPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : 'Pyramid-Tests-cases-specs-custom'
}

{ #category : #accessing }
PyramidVisibilityInputPresenterTest >> dummyValues [

	^ { BlVisibility gone . BlVisibility hidden . BlVisibility visible }
]

{ #category : #tests }
PyramidVisibilityInputPresenterTest >> makeNewInput [

	^ PyramidVisibilityInputPresenter new
]

{ #category : #'as yet unclassified' }
PyramidVisibilityInputPresenterTest >> triggerValueChangedOf: anInput [

	anInput buttonNotVisible click
]
