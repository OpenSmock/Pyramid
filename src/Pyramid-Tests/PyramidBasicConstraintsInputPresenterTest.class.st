Class {
	#name : #PyramidBasicConstraintsInputPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : #'Pyramid-Tests-cases-specs-custom'
}

{ #category : #accessing }
PyramidBasicConstraintsInputPresenterTest >> dummyValues [

	^ {
		  BlLayoutCommonConstraintsAxis new matchParent.
		  BlLayoutCommonConstraintsAxis new fitContent.
		   BlLayoutCommonConstraintsAxis new exact: 50.
		BlLayoutCommonConstraintsAxis new exact: 200. }
]

{ #category : #tests }
PyramidBasicConstraintsInputPresenterTest >> makeNewInput [

	^ PyramidBasicConstraintsInputPresenter new
]

{ #category : #'as yet unclassified' }
PyramidBasicConstraintsInputPresenterTest >> triggerValueChangedOf: anInput [

	anInput buttonExact click
]
