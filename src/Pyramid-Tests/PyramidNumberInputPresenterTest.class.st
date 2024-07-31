Class {
	#name : #PyramidNumberInputPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : #'Pyramid-Tests-cases-specs-custom'
}

{ #category : #accessing }
PyramidNumberInputPresenterTest >> dummyValues [

	^ {
		  1.
		  0.
		  -5556.
		  12.5687.
		  (nil -> PyramidUnknowState new).
		  ('hello' -> PyramidUnknowState new).
		('123456' -> PyramidUnknowState new) }
]

{ #category : #accessing }
PyramidNumberInputPresenterTest >> expectedEmptyValue [

	^ PyramidUnknowState new
]

{ #category : #accessing }
PyramidNumberInputPresenterTest >> expectedMixedValues [

	^ PyramidUnknowState new
]

{ #category : #tests }
PyramidNumberInputPresenterTest >> makeNewInput [

	^ PyramidNumberInputPresenter new
]

{ #category : #'as yet unclassified' }
PyramidNumberInputPresenterTest >> triggerValueChangedOf: anInput [

	anInput inputNumber contextKeyBindings keymaps do: [ :bind |
		bind action value ]
]
