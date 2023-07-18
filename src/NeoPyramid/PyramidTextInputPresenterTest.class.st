Class {
	#name : #PyramidTextInputPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : #'NeoPyramid-cases-property'
}

{ #category : #accessing }
PyramidTextInputPresenterTest >> dummyValues [

	^ { 'hello' . 'hello world' . '123' . '' }
]

{ #category : #tests }
PyramidTextInputPresenterTest >> expectedEmptyValue [

	^ '# empty value'
]

{ #category : #tests }
PyramidTextInputPresenterTest >> expectedMixedValues [

	^ '# mixed values'
]

{ #category : #tests }
PyramidTextInputPresenterTest >> makeNewInput [

	^ PyramidTextInputPresenter new
]

{ #category : #'as yet unclassified' }
PyramidTextInputPresenterTest >> triggerValueChangedOf: anInput [

	anInput textInput contextKeyBindings keymaps do: [ :bind |
		bind action value ]
]
