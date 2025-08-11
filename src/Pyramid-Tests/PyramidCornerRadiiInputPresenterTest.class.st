Class {
	#name : #PyramidCornerRadiiInputPresenterTest,
	#superclass : #TestCase,
	#traits : 'TPyramidInputPresenterTest',
	#classTraits : 'TPyramidInputPresenterTest classTrait',
	#category : #'Pyramid-Tests-cases-plugin-bloc-geometry'
}

{ #category : #accessing }
PyramidCornerRadiiInputPresenterTest >> dummyValues [

	^ {
		  BlCornerRadii empty.
		  (BlCornerRadii radius: 5).
		  (BlCornerRadii new
			   topLeft: 1;
			   topRight: 2;
			   bottomLeft: 3;
			   bottomRight: 4; yourself) }
]

{ #category : #accessing }
PyramidCornerRadiiInputPresenterTest >> expectedEmptyValue [

	^ PyramidUnknowState new
]

{ #category : #accessing }
PyramidCornerRadiiInputPresenterTest >> expectedMixedValues [

	^ PyramidUnknowState new
]

{ #category : #tests }
PyramidCornerRadiiInputPresenterTest >> makeNewInput [

	^ PyramidCornerRadiiInputPresenter new
]

{ #category : #'as yet unclassified' }
PyramidCornerRadiiInputPresenterTest >> triggerValueChangedOf: anInput [

	anInput inputArray inputArray ensureInternalActions
		decoratedGroup entries do: [ :bind | bind execute ]
]

{ #category : #'as yet unclassified' }
PyramidCornerRadiiInputPresenterTest >> triggerValueChangedOfForPharo12AndBelow: anInput [

	anInput inputArray inputArray contextKeyBindings keymaps do: [ :bind |
		bind action value ]
]
