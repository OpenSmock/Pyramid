Class {
	#name : 'PyramidStopsInputPresenterTest',
	#superclass : 'TestCase',
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : 'Pyramid-Tests-cases-specs-custom',
	#package : 'Pyramid-Tests',
	#tag : 'cases-specs-custom'
}

{ #category : 'tests' }
PyramidStopsInputPresenterTest >> makeNewInput [

	^ PyramidBackgroundStopsInputPresenter new
]
