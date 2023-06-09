Class {
	#name : #PyramidPropertySingleInputModel,
	#superclass : #Object,
	#instVars : [
		'input',
		'applyToAllButton',
		'reference'
	],
	#category : #'Pyramid-properties'
}

{ #category : #accessing }
PyramidPropertySingleInputModel >> applyToAllButton [

	^ applyToAllButton
]

{ #category : #accessing }
PyramidPropertySingleInputModel >> applyToAllButton: anObject [

	applyToAllButton := anObject
]

{ #category : #accessing }
PyramidPropertySingleInputModel >> input [

	^ input
]

{ #category : #accessing }
PyramidPropertySingleInputModel >> input: anObject [

	input := anObject
]

{ #category : #accessing }
PyramidPropertySingleInputModel >> reference [

	^ reference
]

{ #category : #accessing }
PyramidPropertySingleInputModel >> reference: anObject [

	reference := anObject
]