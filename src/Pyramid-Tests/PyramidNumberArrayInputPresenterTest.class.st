Class {
	#name : #PyramidNumberArrayInputPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : 'Pyramid-Tests-cases-specs-custom'
}

{ #category : #accessing }
PyramidNumberArrayInputPresenterTest >> dummyValues [

	^ {
	#() -> PyramidUnknowState new.
		 #(1).
		#(2 2).
		#(3 3 3) -> PyramidUnknowState new.
		#(4 4 4 4).
		#(5 5 5 5 5) -> PyramidUnknowState new. }
]

{ #category : #accessing }
PyramidNumberArrayInputPresenterTest >> expectedEmptyValue [

	^ PyramidUnknowState new
]

{ #category : #accessing }
PyramidNumberArrayInputPresenterTest >> expectedMixedValues [

	^ PyramidUnknowState new
]

{ #category : #tests }
PyramidNumberArrayInputPresenterTest >> makeNewInput [

	^ PyramidNumberArrayInputPresenter new
]

{ #category : #'as yet unclassified' }
PyramidNumberArrayInputPresenterTest >> triggerValueChangedOf: anInput [

	anInput inputArray contextKeyBindings keymaps do: [ :bind |
		bind action value ]
]
