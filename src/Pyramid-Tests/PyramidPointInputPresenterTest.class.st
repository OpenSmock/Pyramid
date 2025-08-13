Class {
	#name : #PyramidPointInputPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : #'Pyramid-Tests-cases-specs-custom'
}

{ #category : #accessing }
PyramidPointInputPresenterTest >> dummyValues [

	^ {
		  1 @ 1.
		  0 @ 1.1.
		  -5556 @ -1.
		  12.5687 @ 1.1.
		  (nil -> PyramidUnknowState new).
		   }
]

{ #category : #accessing }
PyramidPointInputPresenterTest >> expectedEmptyValue [

	^ PyramidUnknowState new
]

{ #category : #accessing }
PyramidPointInputPresenterTest >> expectedMixedValues [

	^ PyramidUnknowState new
]

{ #category : #tests }
PyramidPointInputPresenterTest >> makeNewInput [

	^ PyramidPointInputPresenter new
]

{ #category : #'as yet unclassified' }
PyramidPointInputPresenterTest >> triggerValueChangedOf: anInput [

	anInput inputX inputNumber ensureInternalActions decoratedGroup entries
		do: [ :bind | bind execute ]
]

{ #category : #'as yet unclassified' }
PyramidPointInputPresenterTest >> triggerValueChangedOfForPharo12AndBelow: anInput [

	anInput inputX inputNumber contextKeyBindings keymaps do: [ :bind |
		bind action value ]
]
