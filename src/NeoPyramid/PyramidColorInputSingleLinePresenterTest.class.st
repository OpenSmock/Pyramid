Class {
	#name : #PyramidColorInputSingleLinePresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : #'NeoPyramid-cases-specs-custom'
}

{ #category : #accessing }
PyramidColorInputSingleLinePresenterTest >> dummyValues [

	^ {
		  Color black.
		  Color red.
		  Color transparent.
		 Color red translucent }
]

{ #category : #accessing }
PyramidColorInputSingleLinePresenterTest >> expectedEmptyValue [

	^ Color black alpha: 0
]

{ #category : #accessing }
PyramidColorInputSingleLinePresenterTest >> expectedMixedValues [

	^ Color black alpha: 0
]

{ #category : #tests }
PyramidColorInputSingleLinePresenterTest >> makeNewInput [

	^ NeoPyramidColorInputSingleLinePresenter new
]

{ #category : #'as yet unclassified' }
PyramidColorInputSingleLinePresenterTest >> triggerValueChangedOf: anInput [

	anInput hexInput textInput contextKeyBindings keymaps do: [ :bind |
		bind action value ]
]
