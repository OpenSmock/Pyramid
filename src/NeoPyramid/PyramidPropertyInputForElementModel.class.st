Class {
	#name : #PyramidPropertyInputForElementModel,
	#superclass : #PyramidPropertyInputForModel,
	#instVars : [
		'referenceObject'
	],
	#category : #'NeoPyramid-plugin-properties'
}

{ #category : #accessing }
PyramidPropertyInputForElementModel >> referenceObject [

	^ referenceObject
]

{ #category : #accessing }
PyramidPropertyInputForElementModel >> referenceObject: anObject [

	referenceObject := anObject
]
