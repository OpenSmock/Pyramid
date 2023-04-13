Class {
	#name : #PyramidVisualElement,
	#superclass : #Object,
	#instVars : [
		'order'
	],
	#category : #'NeoPyramid-views'
}

{ #category : #accessing }
PyramidVisualElement >> <= aPyramidVisualElement [

	^ self order <= aPyramidVisualElement order
]

{ #category : #accessing }
PyramidVisualElement >> order [
	order ifNil: [ order := 0 ].
	^ order
]

{ #category : #accessing }
PyramidVisualElement >> order: aNumber [

	order := aNumber
]
