Class {
	#name : #PyramidNumberInputPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : #'NeoPyramid-cases-property'
}

{ #category : #accessing }
PyramidNumberInputPresenterTest >> dummyValues [

	^ { 1 . 0 . -5556 . 12.5687 . nil }
]

{ #category : #tests }
PyramidNumberInputPresenterTest >> expectedEmptyValue [

	^ nil
]

{ #category : #tests }
PyramidNumberInputPresenterTest >> expectedMixedValues [

	^ nil
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
