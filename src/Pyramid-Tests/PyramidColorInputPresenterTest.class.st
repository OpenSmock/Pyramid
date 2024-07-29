Class {
	#name : #PyramidColorInputPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : 'Pyramid-Tests-cases-specs-custom'
}

{ #category : #accessing }
PyramidColorInputPresenterTest >> dummyValues [

	^ { Color red . Color transparent . Color blue alpha: 0.5 . Color pink }
]

{ #category : #accessing }
PyramidColorInputPresenterTest >> expectedEmptyValue [

	^ PyramidColorInputPresenter new defaultColor
]

{ #category : #accessing }
PyramidColorInputPresenterTest >> expectedMixedValues [

	^ PyramidColorInputPresenter new defaultColor
]

{ #category : #tests }
PyramidColorInputPresenterTest >> makeNewInput [

	^ PyramidColorInputPresenter new
]

{ #category : #'as yet unclassified' }
PyramidColorInputPresenterTest >> triggerValueChangedOf: anInput [

	anInput svMorph selectedColor: anInput value
]
