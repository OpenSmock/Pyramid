Class {
	#name : 'PyramidColorInputMultiLinesPresenterTest',
	#superclass : 'TestCase',
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : 'Pyramid-Tests-cases-specs-custom',
	#package : 'Pyramid-Tests',
	#tag : 'cases-specs-custom'
}

{ #category : 'accessing' }
PyramidColorInputMultiLinesPresenterTest >> dummyValues [

	^ {
		  Color black.
		  Color red.
		  Color transparent.
		 Color red translucent }
]

{ #category : 'accessing' }
PyramidColorInputMultiLinesPresenterTest >> expectedEmptyValue [

	^ Color black alpha: 0
]

{ #category : 'accessing' }
PyramidColorInputMultiLinesPresenterTest >> expectedMixedValues [

	^ Color black alpha: 0
]

{ #category : 'tests' }
PyramidColorInputMultiLinesPresenterTest >> makeNewInput [

	^ PyramidColorInputMultiLinesPresenter new
]

{ #category : 'as yet unclassified' }
PyramidColorInputMultiLinesPresenterTest >> triggerValueChangedOf: anInput [

	anInput hexaInput hexInput textInput contextKeyBindings keymaps do: [ :bind |
		bind action value ]
]
