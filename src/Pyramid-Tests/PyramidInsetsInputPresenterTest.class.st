Class {
	#name : #PyramidInsetsInputPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : #'Pyramid-Tests-cases-specs-custom'
}

{ #category : #accessing }
PyramidInsetsInputPresenterTest >> dummyValues [

	^ {
		  BlInsets empty.
		  BlInsets all: 5.
		  BlInsets top: 1 left: 2 bottom: 3 right: 4}
]

{ #category : #accessing }
PyramidInsetsInputPresenterTest >> expectedEmptyValue [

	^ PyramidUnknowState new
]

{ #category : #accessing }
PyramidInsetsInputPresenterTest >> expectedMixedValues [

	^ PyramidUnknowState new
]

{ #category : #tests }
PyramidInsetsInputPresenterTest >> makeNewInput [

	^ PyramidInsetsInputPresenter new
]

{ #category : #'as yet unclassified' }
PyramidInsetsInputPresenterTest >> triggerValueChangedOf: anInput [

	anInput inputArray inputArray ensureInternalActions decoratedGroup
		entries do: [ :bind | bind execute ]
]
