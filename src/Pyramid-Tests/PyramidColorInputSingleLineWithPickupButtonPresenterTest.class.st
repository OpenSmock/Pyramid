Class {
	#name : #PyramidColorInputSingleLineWithPickupButtonPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : 'Pyramid-Tests-cases-specs-custom'
}

{ #category : #accessing }
PyramidColorInputSingleLineWithPickupButtonPresenterTest >> dummyValues [

	^ {
		  Color black.
		  Color red.
		  Color transparent.
		 Color red translucent }
]

{ #category : #accessing }
PyramidColorInputSingleLineWithPickupButtonPresenterTest >> expectedEmptyValue [

	^ Color black alpha: 0
]

{ #category : #accessing }
PyramidColorInputSingleLineWithPickupButtonPresenterTest >> expectedMixedValues [

	^ Color black alpha: 0
]

{ #category : #tests }
PyramidColorInputSingleLineWithPickupButtonPresenterTest >> makeNewInput [

	^ PyramidColorInputSingleLineWithPickupButtonPresenter new
]

{ #category : #'as yet unclassified' }
PyramidColorInputSingleLineWithPickupButtonPresenterTest >> triggerValueChangedOf: anInput [

	anInput singleLineInput hexInput textInput contextKeyBindings keymaps do: [ :bind |
		bind action value ]
]
