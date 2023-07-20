Class {
	#name : #PyramidColorInputPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : #'NeoPyramid-cases-specs-custom'
}

{ #category : #accessing }
PyramidColorInputPresenterTest >> dummyValues [

	^ { Color red . Color transparent . Color blue alpha: 0.5 . Color pink }
]

{ #category : #accessing }
PyramidColorInputPresenterTest >> expectedEmptyValue [

	^ NeoPyramidColorInputPresenter new defaultColor
]

{ #category : #accessing }
PyramidColorInputPresenterTest >> expectedMixedValues [

	^ NeoPyramidColorInputPresenter new defaultColor
]

{ #category : #tests }
PyramidColorInputPresenterTest >> makeNewInput [

	^ NeoPyramidColorInputPresenter new
]

{ #category : #'as yet unclassified' }
PyramidColorInputPresenterTest >> triggerValueChangedOf: anInput [

	anInput svMorph selectedColor: anInput value
]
