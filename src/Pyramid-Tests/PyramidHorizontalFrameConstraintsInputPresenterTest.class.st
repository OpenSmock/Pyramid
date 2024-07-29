Class {
	#name : #PyramidHorizontalFrameConstraintsInputPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : 'Pyramid-Tests-cases-specs-custom'
}

{ #category : #accessing }
PyramidHorizontalFrameConstraintsInputPresenterTest >> dummyValues [

	^ {
		  BlFrameLayoutConstraintsHorizontal new alignNone; alignment.
		  BlFrameLayoutConstraintsHorizontal new alignLeft; alignment.
		  BlFrameLayoutConstraintsHorizontal new alignCenter; alignment.
		  BlFrameLayoutConstraintsHorizontal new alignRight; alignment.
		BlFrameLayoutConstraintsHorizontal new alignLeftAt: 0.5; alignment.
		  BlFrameLayoutConstraintsHorizontal new alignCenterAt: 0.5; alignment.
		  BlFrameLayoutConstraintsHorizontal new alignRightAt: 0.5; alignment }
]

{ #category : #accessing }
PyramidHorizontalFrameConstraintsInputPresenterTest >> expectedEmptyValue [

	^ PyramidUnknowState new
]

{ #category : #accessing }
PyramidHorizontalFrameConstraintsInputPresenterTest >> expectedMixedValues [

	^ PyramidUnknowState new
]

{ #category : #tests }
PyramidHorizontalFrameConstraintsInputPresenterTest >> makeNewInput [

	^ PyramidHorizontalFrameConstraintsInputPresenter new
]

{ #category : #'as yet unclassified' }
PyramidHorizontalFrameConstraintsInputPresenterTest >> triggerValueChangedOf: anInput [

	anInput inputRelative inputNumber contextKeyBindings keymaps do: [ :bind |
		bind action value ]
]
