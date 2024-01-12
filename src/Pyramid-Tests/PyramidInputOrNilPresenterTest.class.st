Class {
	#name : #PyramidInputOrNilPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : #'Pyramid-Tests-cases-specs-custom'
}

{ #category : #accessing }
PyramidInputOrNilPresenterTest >> dummyValues [

	^ { 'hello'. 'hello world'. '123'. '' . nil}
]

{ #category : #accessing }
PyramidInputOrNilPresenterTest >> expectedEmptyValue [

	^ nil
]

{ #category : #accessing }
PyramidInputOrNilPresenterTest >> expectedMixedValues [

	^ nil
]

{ #category : #tests }
PyramidInputOrNilPresenterTest >> makeNewInput [

	^ PyramidTextInputPresenter new orNil
]

{ #category : #'as yet unclassified' }
PyramidInputOrNilPresenterTest >> triggerValueChangedOf: anInput [

	anInput inputPresenter textInput contextKeyBindings keymaps do: [ :bind |
		bind action value ]
]
