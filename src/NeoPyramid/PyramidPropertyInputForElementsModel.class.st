Class {
	#name : #PyramidPropertyInputForElementsModel,
	#superclass : #Object,
	#instVars : [
		'elementInput',
		'stateInput',
		'modelInput'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidPropertyInputForElementsModel >> elementInput [

	^ elementInput
]

{ #category : #accessing }
PyramidPropertyInputForElementsModel >> elementInput: anObject [

	elementInput := anObject
]

{ #category : #accessing }
PyramidPropertyInputForElementsModel >> modelInput [

	^ modelInput
]

{ #category : #accessing }
PyramidPropertyInputForElementsModel >> modelInput: anObject [

	modelInput := anObject
]

{ #category : #accessing }
PyramidPropertyInputForElementsModel >> stateInput [

	^ stateInput
]

{ #category : #accessing }
PyramidPropertyInputForElementsModel >> stateInput: anObject [

	stateInput := anObject
]
