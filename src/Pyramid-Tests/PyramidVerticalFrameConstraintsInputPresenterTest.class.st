Class {
	#name : #PyramidVerticalFrameConstraintsInputPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : #'Pyramid-Tests-cases-specs-custom'
}

{ #category : #accessing }
PyramidVerticalFrameConstraintsInputPresenterTest >> dummyValues [

	^ {
		  (BlFrameLayoutConstraintsVertical new
			   alignNone;
			   alignment).
		  (BlFrameLayoutConstraintsVertical new
			   alignTop;
			   alignment).
		  (BlFrameLayoutConstraintsVertical new
			   alignCenter;
			   alignment).
		  (BlFrameLayoutConstraintsVertical new
			   alignBottom;
			   alignment).
		  (BlFrameLayoutConstraintsVertical new
			   alignTopAt: 0.5;
			   alignment).
		  (BlFrameLayoutConstraintsVertical new
			   alignCenterAt: 0.5;
			   alignment).
		  (BlFrameLayoutConstraintsVertical new
			   alignBottomAt: 0.5;
			   alignment) }
]

{ #category : #accessing }
PyramidVerticalFrameConstraintsInputPresenterTest >> expectedEmptyValue [

	^ PyramidUnknowState new
]

{ #category : #accessing }
PyramidVerticalFrameConstraintsInputPresenterTest >> expectedMixedValues [

	^ PyramidUnknowState new
]

{ #category : #tests }
PyramidVerticalFrameConstraintsInputPresenterTest >> makeNewInput [

	^ PyramidVerticalFrameConstraintsInputPresenter new
]

{ #category : #'as yet unclassified' }
PyramidVerticalFrameConstraintsInputPresenterTest >> triggerValueChangedOf: anInput [

	anInput inputRelative inputNumber ensureInternalActions
		decoratedGroup entries do: [ :bind | bind execute ]
]
