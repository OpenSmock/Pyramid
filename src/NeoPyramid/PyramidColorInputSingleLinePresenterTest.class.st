Class {
	#name : #PyramidColorInputSingleLinePresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : #'NeoPyramid-cases-specs-custom'
}

{ #category : #accessing }
PyramidColorInputSingleLinePresenterTest >> dummyValues [

	^ {
		  Color black.
		  Color red.
		  Color transparent.
		 Color red translucent }
]

{ #category : #tests }
PyramidColorInputSingleLinePresenterTest >> makeNewInput [

	^ NeoPyramidColorInputSingleLinePresenter new
]
