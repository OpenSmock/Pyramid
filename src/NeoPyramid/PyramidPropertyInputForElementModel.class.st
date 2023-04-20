Class {
	#name : #PyramidPropertyInputForElementModel,
	#superclass : #Object,
	#instVars : [
		'elementInput',
		'stateInput',
		'modelInput'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidPropertyInputForElementModel >> elementInput [

	^ elementInput
]

{ #category : #accessing }
PyramidPropertyInputForElementModel >> elementInput: anObject [

	elementInput := anObject
]

{ #category : #accessing }
PyramidPropertyInputForElementModel >> modelInput [

	^ modelInput
]

{ #category : #accessing }
PyramidPropertyInputForElementModel >> modelInput: anObject [

	modelInput := anObject
]

{ #category : #accessing }
PyramidPropertyInputForElementModel >> stateInput [

	^ stateInput
]

{ #category : #accessing }
PyramidPropertyInputForElementModel >> stateInput: anObject [

	stateInput := anObject
]
