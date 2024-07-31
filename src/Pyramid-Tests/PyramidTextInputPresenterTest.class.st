Class {
	#name : #PyramidTextInputPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : #'Pyramid-Tests-cases-specs-custom'
}

{ #category : #accessing }
PyramidTextInputPresenterTest >> dummyValues [

	^ { 'hello' . 'hello world' . '123' . '' }
]

{ #category : #accessing }
PyramidTextInputPresenterTest >> expectedEmptyValue [

	^ PyramidEmptyValue new asString
]

{ #category : #accessing }
PyramidTextInputPresenterTest >> expectedMixedValues [

	^ PyramidMixedValues new asString
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
