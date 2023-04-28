Class {
	#name : #PyramidSimplePresenter,
	#superclass : #PyramidVisualElement,
	#instVars : [
		'presenter',
		'constraints'
	],
	#category : #'NeoPyramid-views-deprecated'
}

{ #category : #accessing }
PyramidSimplePresenter >> constraints [

	^ constraints
]

{ #category : #accessing }
PyramidSimplePresenter >> constraints: anObject [

	constraints := anObject
]

{ #category : #accessing }
PyramidSimplePresenter >> presenter [

	^ presenter
]

{ #category : #accessing }
PyramidSimplePresenter >> presenter: anObject [

	presenter := anObject
]
