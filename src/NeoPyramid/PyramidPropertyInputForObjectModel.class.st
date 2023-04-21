Class {
	#name : #PyramidPropertyInputForObjectModel,
	#superclass : #Object,
	#instVars : [
		'elementInput',
		'stateInput',
		'modelInput',
		'referenceObject'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidPropertyInputForObjectModel >> elementInput [

	^ elementInput
]

{ #category : #accessing }
PyramidPropertyInputForObjectModel >> elementInput: anObject [

	elementInput := anObject
]

{ #category : #accessing }
PyramidPropertyInputForObjectModel >> modelInput [

	^ modelInput
]

{ #category : #accessing }
PyramidPropertyInputForObjectModel >> modelInput: anObject [

	modelInput := anObject
]

{ #category : #accessing }
PyramidPropertyInputForObjectModel >> referenceObject [

	^ referenceObject
]

{ #category : #accessing }
PyramidPropertyInputForObjectModel >> referenceObject: anObject [

	referenceObject := anObject
]

{ #category : #accessing }
PyramidPropertyInputForObjectModel >> stateInput [

	^ stateInput
]

{ #category : #accessing }
PyramidPropertyInputForObjectModel >> stateInput: anObject [

	stateInput := anObject
]
